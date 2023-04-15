//
//  UIViewController+Extensions.swift
//  Affinitee
//
//  Created by Clement Joseph on 13/07/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages


extension UIViewController {
    
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        
//        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
//        tap.cancelsTouchesInView = false
//        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(message: String) -> Void {
        
        
        // Instantiate a message view from the provided card view layout. SwiftMessages searches for nib
        // files in the main bundle first, so you can easily copy them into your project and make changes.
        let view = MessageView.viewFromNib(layout: .cardView)
        
        
        view.configureContent(title: "", body: message, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Hide", buttonTapHandler: { _ in SwiftMessages.hide() })
        
        view.configureTheme(.info, iconStyle: .default)
        view.accessibilityPrefix = "info"
        
        view.configureDropShadow()
        
        view.button?.isHidden = true
        
        view.iconImageView?.isHidden = false
        view.iconLabel?.isHidden = false
        
        view.titleLabel?.isHidden = true
        
        view.bodyLabel?.isHidden = false
        
        var config = SwiftMessages.defaultConfig
        
        config.presentationStyle = .top
        
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        
        config.duration = .seconds(seconds: 2)
        
        config.dimMode = .gray(interactive: true)
        
        config.shouldAutorotate = true
        
        config.interactiveHide = true
        
        config.preferredStatusBarStyle = .lightContent
        
        
        SwiftMessages.show(config: config, view: view)

        
        
    }
    
    
}
