//
//  EmptyStateCell.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit
import IGListKit

final class EmptyStateCell: UICollectionViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
        
}

// MARK: - ListBindable

extension EmptyStateCell: ListBindable {
    
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? EmptyStateViewModel
            else { return }
        
        imageView.image = UIImage(named: viewModel.imageName)
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
    }
    
}
