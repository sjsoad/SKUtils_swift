//
//  SKTextFieldsManager.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class SKTextFieldsManager: NSObject, UIGestureRecognizerDelegate {

    var textFields : [AnyObject] = Array()

    @IBOutlet var scroll : UIScrollView? = nil {
        didSet {
            self.getTextFieldsInView(scroll)
        }
    }
    
    @IBInspectable var hideOnTap : Bool = true {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(SKTextFieldsManager.hideKeyboard))
            if let scroll = self.scroll {
                scroll.addGestureRecognizer(tap)
            }
        }
    }
    
    override init() {
        super.init()
        self.subscribeForKeyboardNotifications()
    }
    
    func getTextFieldsInView(view: UIView?) -> Void {
        if let parent = view {
            for subView in parent.subviews {
                if subView.isKindOfClass(UITextField) {
                    let textField = subView as! UITextField
                    textField.addTarget(self, action: #selector(SKTextFieldsManager.textFieldReturnButtonPressed), forControlEvents: UIControlEvents.EditingDidEndOnExit)
                    self.textFields.append(textField)
                }
                else {
                    self.getTextFieldsInView(subView)
                }
            }
        }
    }
    
    func subscribeForKeyboardNotifications() -> Void {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SKTextFieldsManager.keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SKTextFieldsManager.keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) -> Void {
        NSLog("show")
    }
    
    func keyboardWillHide(notification: NSNotification) -> Void {
        NSLog("hide")
    }
    
    func firstResponder() -> UITextField? {
        for textField in self.textFields {
            if textField.isFirstResponder() {
                return textField as? UITextField
            }
        }
        return nil
    }
    
    func textFieldReturnButtonPressed(textField: UITextField) -> Void {
        NSLog("%@", textField.description)
    }
    
    func hideKeyboard() -> Void {
        self.textFields.forEach { textField in
            textField.resignFirstResponder()
        }
    }
}
