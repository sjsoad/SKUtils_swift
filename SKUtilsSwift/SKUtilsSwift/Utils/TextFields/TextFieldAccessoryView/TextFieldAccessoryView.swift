//
//  SKTextFieldAccessoryView.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 17.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

enum AccessoryViewState : Int {
    case accessoryViewStateError
    case accessoryViewStateSuccess
    case accessoryViewStateDefault
    case accessoryViewStateActive
    
    static func stateForBool(_ valid: Bool) -> AccessoryViewState {
        if valid {
            return .accessoryViewStateSuccess
        }
        else {
            return .accessoryViewStateError
        }
    }
}

typealias drawingHandler = (_ view: TextFieldAccessoryView) -> Void

class TextFieldAccessoryView: UIView {
    
    @IBInspectable var errorStateColor   : UIColor = UIColor.red
    @IBInspectable var successStateColor : UIColor = UIColor.green
    @IBInspectable var defaultStateColor : UIColor = UIColor.lightGray
    @IBInspectable var activeStateColor  : UIColor = UIColor.darkGray
    
    var drawing: drawingHandler?
    
    var currentViewState: AccessoryViewState = .accessoryViewStateDefault {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    func currentStateColor() -> UIColor {
        switch self.currentViewState {
        case .accessoryViewStateError   : return self.errorStateColor
        case .accessoryViewStateSuccess : return self.successStateColor
        case .accessoryViewStateDefault : return self.defaultStateColor
        case .accessoryViewStateActive  : return self.activeStateColor
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let drawingHandler = self.drawing {
            drawingHandler(self)
        }
        else {
            self.layer.borderColor = self.currentStateColor().cgColor
        }
    }
}
