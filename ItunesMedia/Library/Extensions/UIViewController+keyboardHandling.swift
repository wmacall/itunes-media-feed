//
//  UIViewController+keyboardHandling.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit

extension UIViewController {
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func subscribeToKeyboardChange(target: UIViewController, selector: Selector ) {
        NotificationCenter.default.addObserver(
            self,
            selector: selector,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: selector,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: selector,
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
    }
}
