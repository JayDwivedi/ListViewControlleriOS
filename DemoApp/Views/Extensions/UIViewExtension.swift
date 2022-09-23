//
//  UIViewExtension.swift
//  DemoApp
//
//  Created by Jay on 23/09/22.
//

import UIKit

extension UIView {
    
    func addShadow() {
        self.layer.cornerRadius = 10

        // border
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1.5

        // drop shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 8.0
        self.layer.shadowOffset = CGSize(width: 2.0, height: 6.0)
    }
}
