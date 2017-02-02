//
//  SuggestionView+Appearance.swift
//  MyWeather
//
//  Created by Mac on 15.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

extension SuggestionView {

    func show() {
        self.change(alphaAnimated: 1)
    }
    
    func hide() {
        self.change(alphaAnimated: 0)
    }
    
    private func change(alphaAnimated alpha: CGFloat) {
        UIView.animate(withDuration: 0.25) {
            self.alpha = alpha
        }
    }
    
}
