//
//  NSMutableAttributedString+helper.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    func setColorForText(_ text: String, withColor color: UIColor) {
        let range: NSRange = mutableString.range(
            of: text,
            options: .caseInsensitive
        )
                
        addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: color,
            range: range
        )
    }
    
    static func attributedString(
        _ text: String,
        font: UIFont,
        color: UIColor
    ) -> NSMutableAttributedString {
        
        let attributesForName: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor : color,
            NSAttributedString.Key.font: font
        ]
        let attributedString = NSMutableAttributedString(
            string: text,
            attributes: attributesForName
        )
        return attributedString
    }
}
