//
//  BottomBorderDecorator.swift
//  Nioxin
//
//  Created by Evgeniy Leychenko on 21.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import Foundation
import UIKit

class BottomBorderDecorator {
    
    fileprivate var borderHeight: CGFloat
    fileprivate var borderColor: UIColor
    
    init(withHeight height: CGFloat, color: UIColor) {
        borderHeight = height
        borderColor = color
    }
}

extension BottomBorderDecorator: Decorator {
    
    func decorate<Object>(component: Object) {
        guard let view = component as? UIView else {
            return
        }
        
        let borderView = UIView()
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.backgroundColor = borderColor
        
        view.addSubview(borderView)
        
        let heightConstraint = NSLayoutConstraint(item: borderView,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: borderHeight)
        borderView.addConstraint(heightConstraint)
        
        let bottomConstraint = NSLayoutConstraint(item: borderView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: 0)
        let leftConstraint = NSLayoutConstraint(item: borderView,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .leading,
                                                  multiplier: 1,
                                                  constant: 0)
        let rightConstraint = NSLayoutConstraint(item: borderView,
                                                  attribute: .trailing,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .trailing,
                                                  multiplier: 1,
                                                  constant: 0)
        view.addConstraints([bottomConstraint, leftConstraint, rightConstraint])
    }
}
