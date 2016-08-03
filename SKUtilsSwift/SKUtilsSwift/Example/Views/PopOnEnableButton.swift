//
//  PopOnEnableButton.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 03.08.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import Spring

class PopOnEnableButton: SpringButton {

    override var enabled: Bool {
        didSet {
            self.animateButton()
        }
    }

    func animateButton() -> Void {
        self.animation = "pop"
        self.curve = "easeOut"
        self.force = CGFloat.random(0.1, max: 0.2)
        self.duration = CGFloat.random(0.3, max: 0.5)
        self.animate()
    }
    
}
