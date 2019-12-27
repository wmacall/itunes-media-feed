//
//  UIResponder+actions.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit

extension UIResponder {
    
    @objc func searchValueDidChange(_ value: String?) {
        next?.searchValueDidChange(value)
    }
    
    @objc func didSelectMedia(_ viewModel: Any) {
        next?.didSelectMedia(viewModel)
    }
    
}
