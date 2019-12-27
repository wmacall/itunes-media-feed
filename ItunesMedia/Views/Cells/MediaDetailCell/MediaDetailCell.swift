//
//  MediaDetailCell.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit
import Nuke
import IGListKit

final class MediaDetailCell: UICollectionViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var footerLabel: UILabel!

    // MARK: - Attributes
    
    var viewModel: MediaDetailCellViewModel?
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.clipsToBounds = true
    }
    
    @IBAction func didTapStore(_ sender: UIButton) {
        guard let viewModel = viewModel,
            let url = viewModel.storeURL
            else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
        
}

// MARK: - ListDiffable

extension MediaDetailCell: ListBindable {
    
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? MediaDetailCellViewModel
            else { return }
        
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        footerLabel.text = viewModel.date
        
        if let imageURL = viewModel.imageURL {
            Nuke.loadImage(
                with: imageURL,
                options: K.Nuke.options,
                into: imageView
            )
        }
        
        self.viewModel = viewModel
    }
    
}
