//
//  MediaCell.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit
import Nuke
import IGListKit
import SkeletonView

final class MediaCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var infoStackView: UIStackView!
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stopSkeletonAnimation()
        hideSkeleton()
    }
    
}

// MARK: - ViewModelBindable

extension MediaCell: ListBindable {
    
    func bindViewModel(_ viewModel: Any) {
        switch viewModel {
        case is SkeletonCellViewModel:
            DispatchQueue.main.async { [unowned self] in
                self.showAnimatedSkeleton()
            }
            
        case let songCellViewModel as MediaCellViewModel:
            titleLabel.text = songCellViewModel.title
            subtitleLabel.text = songCellViewModel.subtitle
            releaseDate.text = songCellViewModel.date
            
            if let imageURL = songCellViewModel.imageURL {
                Nuke.loadImage(
                    with: imageURL,
                    options: K.Nuke.options,
                    into: imageView
                )
            }
            
        default: break
        }
    }
    
}