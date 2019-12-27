//
//  ActionableCollectionHeaderView.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit
import SkeletonView

final class SectionTitleHeaderView: UICollectionReusableView {

    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }        
    
    // MARK: - Helpers
    
    func setupActionableHeader(with title: String) {
        titleLabel.text = title                        
    }
    
    func setupSkeletonView(isSkeletoneable: Bool) {
        if isSkeletoneable {
            showSkeleton()
            return
        }
        
        stopSkeletonAnimation()
        hideSkeleton()
    }
    
}
