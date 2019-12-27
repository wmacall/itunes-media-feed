//
//  UIView+pintToEdges.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit

extension UIView {
    func pinToEdges(to view: UIView) {
           NSLayoutConstraint.activate([
               topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               leadingAnchor.constraint(equalTo: view.leadingAnchor),
               bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
               trailingAnchor.constraint(equalTo: view.trailingAnchor)
           ])
       }
}
