//
//  MapSearchView+Appearance.swift
//  MyWeather
//
//  Created by Mac on 15.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

extension MapSearchView {

    //MARK: - Private
    
    func show() {
        changeConstraints(priority: UILayoutPriorityDefaultLow)
        let animation = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.layoutIfNeeded()
        }
        let completion: (Bool) -> Swift.Void = { [weak self] completed in
            guard let strongSelf = self else { return }
            strongSelf.searchField.becomeFirstResponder()
        }
        animate(animation: animation,
                completion: completion)
    }
    
    func hide() {
        let animation = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.changeConstraints(priority: UILayoutPriorityDefaultHigh)
            strongSelf.layoutIfNeeded()
        }
        animate(animation: animation)
    }
    
    func changeConstraints(priority: UILayoutPriority) {
        leadingConstraint.priority = priority
        widthConstraint.priority = priority
    }
    
    private func animate(animation: @escaping () -> Swift.Void,
                         completion: ((Bool) -> Swift.Void)? = nil) {
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.8,
                       options: .curveEaseInOut,
                       animations: animation,
                       completion: completion)
    }
    
}
