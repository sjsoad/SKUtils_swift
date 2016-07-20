//
//  SKTextFieldAccessoryView.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 17.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import Spring

enum SKAccessoryViewState : Int {
    case SKAccessoryViewStateError
    case SKAccessoryViewStateSuccess
    case SKAccessoryViewStateDefault
    case SKAccessoryViewStateActive
    
    static func stateForBool(valid: Bool) -> SKAccessoryViewState {
        if valid {
            return .SKAccessoryViewStateSuccess
        }
        else {
            return .SKAccessoryViewStateError
        }
    }
}

typealias drawingClosure = (view: SKTextFieldAccessoryView) -> Void

class SKTextFieldAccessoryView: SpringView {
    
    @IBInspectable var errorStateColor   : UIColor = UIColor.redColor()
    @IBInspectable var successStateColor : UIColor = UIColor.greenColor()
    @IBInspectable var defaultStateColor : UIColor = UIColor.lightGrayColor()
    @IBInspectable var activeStateColor  : UIColor = UIColor.darkGrayColor()
    
    var closure: drawingClosure?
    
    var currentViewState: SKAccessoryViewState = .SKAccessoryViewStateDefault {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    func currentStateColor() -> UIColor {
        switch self.currentViewState {
        case .SKAccessoryViewStateError   : return self.errorStateColor
        case .SKAccessoryViewStateSuccess : return self.successStateColor
        case .SKAccessoryViewStateDefault : return self.defaultStateColor
        case .SKAccessoryViewStateActive  : return self.activeStateColor
        }
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        if let drawingClosure = self.closure {
            drawingClosure(view: self)
        }
        else {
            self.layer.borderColor = self.currentStateColor().CGColor
        }
    }
}