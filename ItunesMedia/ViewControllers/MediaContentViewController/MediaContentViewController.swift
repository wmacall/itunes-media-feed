//
//  MediaContentViewController.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import IGListKit

final class MediaContentViewController: UIViewController {
    
    // MARK: - Components
    
    private lazy var collectionView: UICollectionView = {
        return UICollectionView.defaultCollectionView()
    }()
    
    // MARK: - Attributes
    
    var viewModel: MediaContentViewModel!
    private let disposeBag = DisposeBag()
    
    // MARK: - DataSources
    
    private lazy var dataSource: ListSectionDataSource = {
        return ListSectionDataSource()
    }()
    
    // MARK: - Adapters
    
    private lazy var listAdapter: ListAdapter = {
        return ListAdapter(
            updater: ListAdapterUpdater(),
            viewController: self
        )
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        view.backgroundColor = .white
        
        setupLayout()
        bindViewModel()
        
        listAdapter.dataSource = dataSource
        listAdapter.collectionView = collectionView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    // MARK: - BindViewModel
    
    private func bindViewModel() {
        // OUTPUTS
        
        viewModel.mediaContent
            .drive(onNext: { [weak self] objects in
                guard let self = self else { return }
                
                self.dataSource.objects = objects
                self.listAdapter.performUpdates(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        view.addSubview(collectionView)
        collectionView.pinToEdges(to: view)
    }
    
}
