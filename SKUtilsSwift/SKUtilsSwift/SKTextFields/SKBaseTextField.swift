//
//  SKBaseTextField.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 18.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

enum SKValidationRule : Int {
    case SKValidationRuleEndEditing
    case SKValidationRuleTextDidChange
}

typealias validationClosure = (textField: SKBaseTextField ,accessoryView: SKTextFieldAccessoryView?, valid: Bool) -> Void

class SKBaseTextField: UITextField {

    var validationRule : SKValidationRule = .SKValidationRuleEndEditing {
        didSet {
            switch validationRule {
            case .SKValidationRuleEndEditing:
                self.addTarget(self, action: #selector(SKBaseTextField.validate), forControlEvents: UIControlEvents.EditingDidEnd)
                break

            case .SKValidationRuleTextDidChange:
                self.addTarget(self, action: #selector(SKBaseTextField.validate), forControlEvents: UIControlEvents.EditingChanged)
                break
            }
        }
    }
    
    var valid : Bool = false
    var closure : validationClosure?
    
    @IBInspectable var validationRuleBuilder: Int = 0 {
        didSet {
            switch validationRuleBuilder {
            case 0:
                self.validationRule = .SKValidationRuleEndEditing
                break
            case 1:
                self.validationRule = .SKValidationRuleTextDidChange
                break
            default:
                break
            }
        }
    }
    @IBOutlet var textValidator : SKBaseValidator? = SKBaseValidator()
    @IBOutlet var accessoryView : SKTextFieldAccessoryView?
    
    func validate() {
        if let text = self.text {
            if let validator = self.textValidator {
                valid = validator.isTextValid(text)
                if let closure = self.closure {
                    closure(textField: self, accessoryView: self.accessoryView, valid: self.valid)
                }
            }
        }
    }
    
}
