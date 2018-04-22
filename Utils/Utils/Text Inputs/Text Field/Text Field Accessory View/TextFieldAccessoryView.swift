//
//  SKTextFieldAccessoryView.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 17.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

enum AccessoryViewState: Int {
    case error
    case success
    case defaults
    case active
    
    static func stateForBool(_ valid: Bool) -> AccessoryViewState {
        if valid {
            return .success
        } else {
            return .error
        }
    }
}

typealias DrawingHandler = (_ view: TextFieldAccessoryView) -> Void

public class TextFieldAccessoryView: UIView {
    
    @IBInspectable var errorStateColor: UIColor = UIColor.red
    @IBInspectable var successStateColor: UIColor = UIColor.green
    @IBInspectable var defaultStateColor: UIColor = UIColor.lightGray
    @IBInspectable var activeStateColor: UIColor = UIColor.darkGray
    
    var drawing: DrawingHandler?
    
    var currentViewState: AccessoryViewState = .defaults {
        didSet {
            setNeedsDisplay()
        }
    }
    
    func currentStateColor() -> UIColor {
        switch currentViewState {
        case .error   : return errorStateColor
        case .success : return successStateColor
        case .defaults : return defaultStateColor
        case .active  : return activeStateColor
        }
    }

    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        if let drawingHandler = drawing {
            drawingHandler(self)
        } else {
            layer.borderColor = currentStateColor().cgColor
        }
    }
}
