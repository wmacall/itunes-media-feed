//
//  MediaFeedViewController.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import IGListKit

final class MediaFeedViewController: UIViewController {
    
    // MARK: - Components
    
    private lazy var collectionView: UICollectionView = {
       return UICollectionView.defaultCollectionView()
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        return refresh
    }()
    
    lazy var hideKeyboardGesture: UITapGestureRecognizer = {
        return UITapGestureRecognizer(
            target: self,
            action: #selector(hideKeyboard)
        )
    }()
    
    // MARK: - Attributes
    
    var viewModel: MediaFeedViewModel!
    weak var delegate: MediaFeedViewControllerDelegate?
    private let disposeBag = DisposeBag()
    
    // MARK: - DataSources
    
    private lazy var dataSource: ListSectionDataSource = {
        return ListSectionDataSource()
    }()
    
    // MARK: - Adapters
    
    private lazy var listAdapter: ListAdapter = {
        return ListAdapter(
            updater: ListAdapterUpdater(),
            viewController: self,
            workingRangeSize: 2
        )
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLayout()
        bindViewModel()
        
        listAdapter.dataSource = dataSource
        listAdapter.collectionView = collectionView
        collectionView.refreshControl = refreshControl
        keyboardHandling()
        listAdapter.scrollViewDelegate = self        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - IBActions
        
    override func searchValueDidChange(_ value: String?) {
        viewModel.searchQuery.onNext(value)
    }
    
    override func didSelectMedia(_ viewModel: Any) {
        guard let viewModel = viewModel as? MediaCellViewModel
            else { return }
        
        delegate?.mediaFeedViewControllerDidSelectMedia(viewModel.model)
    }
    
    // MARK: - ViewModel
    
    private func bindViewModel() {
        // INPUTS
        
        refreshControl.rx
            .controlEvent(.valueChanged)
            .map { [unowned self] in
                self.refreshControl.isRefreshing
        }
        .filter { $0 == true }
        .map { _ in () }
        .bind(to: viewModel.pullToRefresh)
        .disposed(by: disposeBag)
        
        // OUTPUTS
        
        viewModel.shouldUpdateFeed
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                
                self.refreshControl.endRefreshing()
                self.dataSource.objects = self.viewModel.listObjects
                self.listAdapter.performUpdates(animated: false)
            })
            .disposed(by: disposeBag)
        
    }    
    
    // MARK: - Layout
    
    private func setupLayout() {
        view.addSubview(collectionView)
        collectionView.pinToEdges(to: view)
    }
    
    @objc private func keyboardWillChange(_ notification: Notification) {
        guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
            else { return }
        
        switch notification.name {
        case UIResponder.keyboardWillShowNotification:
            view.addGestureRecognizer(hideKeyboardGesture)
            collectionView.contentInset.bottom = frame.height
            
        case UIResponder.keyboardWillHideNotification:
            view.removeGestureRecognizer(hideKeyboardGesture)
            collectionView.contentInset = .zero
            
        default: break
        }
    }
    
    private func keyboardHandling() {
        subscribeToKeyboardChange(
            target: self,
            selector: #selector(keyboardWillChange(_:))
        )
    }
}

// MARK: - UIScrollViewDelegate

extension MediaFeedViewController: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let distance = self.collectionView.distance(
            targetContentOffsetPointee: targetContentOffset
        )
        
        if distance < 80 {
            viewModel.shouldLoadMore.onNext(())
        }
    }
    
}
