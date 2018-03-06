//
//  UIView+AnimatedValue.swift
//  Yada
//
//  Created by Sergey on 06.03.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

extension UIView {
    
    func animateValue(_ value: Any?,
                      forKey key: String,
                      duration: TimeInterval = Defaults.animationDuration,
                      options: UIViewAnimationOptions = .transitionCrossDissolve) {
        UIView.transition(with: self, duration: duration, options: options, animations: {
            self.setValue(value, forKey: key)
        }, completion: nil)
    }
    
}
