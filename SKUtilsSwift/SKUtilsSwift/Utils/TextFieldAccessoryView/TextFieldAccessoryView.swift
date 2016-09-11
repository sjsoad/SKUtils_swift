//
//  SKTextFieldAccessoryView.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 17.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import Spring

enum AccessoryViewState : Int {
    case AccessoryViewStateError
    case AccessoryViewStateSuccess
    case AccessoryViewStateDefault
    case AccessoryViewStateActive
    
    static func stateForBool(valid: Bool) -> AccessoryViewState {
        if valid {
            return .AccessoryViewStateSuccess
        }
        else {
            return .AccessoryViewStateError
        }
    }
}

typealias drawingHandler = (view: TextFieldAccessoryView) -> Void

class TextFieldAccessoryView: SpringView {
    
    @IBInspectable var errorStateColor   : UIColor = UIColor.redColor()
    @IBInspectable var successStateColor : UIColor = UIColor.greenColor()
    @IBInspectable var defaultStateColor : UIColor = UIColor.lightGrayColor()
    @IBInspectable var activeStateColor  : UIColor = UIColor.darkGrayColor()
    
    var drawing: drawingHandler?
    
    var currentViewState: AccessoryViewState = .AccessoryViewStateDefault {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    func currentStateColor() -> UIColor {
        switch self.currentViewState {
        case .AccessoryViewStateError   : return self.errorStateColor
        case .AccessoryViewStateSuccess : return self.successStateColor
        case .AccessoryViewStateDefault : return self.defaultStateColor
        case .AccessoryViewStateActive  : return self.activeStateColor
        }
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        if let drawingHandler = self.drawing {
            drawingHandler(view: self)
        }
        else {
            self.layer.borderColor = self.currentStateColor().CGColor
        }
    }
}
