//
//  FeedHeaderView.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit
import IGListKit

final class FeedHeaderReusableView: UICollectionReusableView {
    
    // MARK: - Components
        
    private lazy var headerView: FeedHeaderView = {
        let view = FeedHeaderView.loadFromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //  MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: - ListBindable

extension FeedHeaderReusableView: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        switch viewModel {
        case let feedHeaderViewModel as FeedHeaderViewModel:
            headerView.dayLabel.text = feedHeaderViewModel.day
            
        default: break
        }
    }
}
