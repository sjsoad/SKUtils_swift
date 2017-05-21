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

class TextFieldAccessoryView: UIView {
    
    @IBInspectable var errorStateColor: UIColor = UIColor.red
    @IBInspectable var successStateColor: UIColor = UIColor.green
    @IBInspectable var defaultStateColor: UIColor = UIColor.lightGray
    @IBInspectable var activeStateColor: UIColor = UIColor.darkGray
    
    var drawing: DrawingHandler?
    
    var currentViewState: AccessoryViewState = .defaults {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    func currentStateColor() -> UIColor {
        switch self.currentViewState {
        case .error   : return self.errorStateColor
        case .success : return self.successStateColor
        case .defaults : return self.defaultStateColor
        case .active  : return self.activeStateColor
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let drawingHandler = self.drawing {
            drawingHandler(self)
        } else {
            self.layer.borderColor = self.currentStateColor().cgColor
        }
    }
}
