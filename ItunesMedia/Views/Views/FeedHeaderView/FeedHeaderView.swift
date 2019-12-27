//
//  HomeHeaderView.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit
import Reusable

final class FeedHeaderView: UIView, NibLoadable {
    
    // MARK: - IBOutlets

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
        
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTitleLabel()
        searchBar.delegate = self
    }
    
    // MARK: - Helpers
    
    private func setupTitleLabel() {
        let attributedTitle = NSMutableAttributedString.attributedString(
            L10n.homeHeaderTitle,
            font: .systemFont(ofSize: 34, weight: .bold),
            color: R.Colors.blueBase.color
        )
        
        titleLabel.attributedText = attributedTitle
    }
}

// MARK: - UISearchBarDelegate

extension FeedHeaderView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchValueDidChange(searchText)
    }
    
}
