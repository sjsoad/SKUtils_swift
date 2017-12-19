//
//  ViewAnimator.swift
//  ShadeChartsWella
//
//  Created by Sergey Kostyan on 19.12.2017.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

enum SlideDirection {
    case forward
    case backward
}

class ViewAnimator: NSObject {

    private static var duration: TimeInterval = Defaults.animationDuration
    
    class func animation(with view: UIView, animationBlock: @escaping (() -> Void)) {
        UIView.transition(with: view,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: animationBlock,
                          completion: nil)
    }
    
    class func slideAnimation(for view: UIView, direction: SlideDirection) {
        let transition = CATransition()
        transition.type = kCATransitionPush
        transition.subtype = direction == .backward ? kCATransitionFromLeft : kCATransitionFromRight
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.fillMode = kCAFillModeRemoved
        view.layer.add(transition, forKey: "slideTransition")
    }
    
}
