//
//  TextBasedCell.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit
import IGListKit

final class TextBasedCell: UICollectionViewCell {
    
    // MARK: - Components
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        layer.cornerRadius = 12
        clipsToBounds = true        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}

// MARK: - ListBindable

extension TextBasedCell: ListBindable {
    
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? TextBasedCellViewModel
            else { return }
        
        let attributedText = NSMutableAttributedString.attributedString(
            viewModel.title,
          font: UIFont.systemFont(ofSize: 15, weight: .bold),
          color: R.Colors.black.color
        )
                
        let attributedAddress = NSMutableAttributedString.attributedString(
            "\n\n\(viewModel.content)",
          font: UIFont.systemFont(ofSize: 13, weight: .regular),
          color: R.Colors.graySmooth.color
        )
        attributedText.append(attributedAddress)
        textLabel.attributedText = attributedText
    }
    
}
