//
//  SKTextFieldsManager.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

let kAnimationDuration = 0.25

class TextFieldsManager: NSObject, UIGestureRecognizerDelegate {

    var textFields : [AnyObject] = Array()

    @IBOutlet var scroll : UIScrollView? = nil {
        didSet {
            self.getTextFieldsInView(scroll)
        }
    }
    @IBInspectable var hideOnTap : Bool = true {
        didSet {
            if hideOnTap {
                self.addTapGestureRecognizer()
            }
        }
    }
    @IBInspectable var additionalSpaceAboveKeyboard : CGFloat = 0.0
    
    override init() {
        super.init()
        self.subscribeForKeyboardNotifications()
    }
    
    //MARK: - Getting UITextFields
    
    func getTextFieldsInView(view: UIView?) -> Void {
        if let parent = view {
            for subView in parent.subviews {
                if subView.isKindOfClass(UITextField) {
                    let textField = subView as! UITextField
                    textField.addTarget(self,
                                        action: #selector(TextFieldsManager.textFieldReturnButtonPressed),
                                        forControlEvents: UIControlEvents.EditingDidEndOnExit)
                    self.textFields.append(textField)
                }
                else {
                    self.getTextFieldsInView(subView)
                }
            }
        }
    }
    
    //MARK: - Set hide keyboard on tap
    
    func addTapGestureRecognizer() -> Void {
        if self.hideOnTap {
            let tap = UITapGestureRecognizer(target: self,
                                             action: #selector(TextFieldsManager.hideKeyboard))
            if let scroll = self.scroll {
                scroll.addGestureRecognizer(tap)
            }
        }
    }
    
    //MARK: - Subscribe for keyboard notifications
    
    func subscribeForKeyboardNotifications() -> Void {
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(TextFieldsManager.keyboardWillShow),
                                                         name: UIKeyboardWillShowNotification,
                                                         object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(TextFieldsManager.keyboardWillHide),
                                                         name: UIKeyboardWillHideNotification,
                                                         object: nil)
    }
    
    //MARK: - Handle keyboard notifications
    
    func keyboardWillShow(notification: NSNotification) -> Void {
        if let rect = notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue() {
            UIView.animateWithDuration(kAnimationDuration) {
                if let scroll = self.scroll {
                    scroll.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
                    self.scrollToActiveTextField(rect.size.height)
                }
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) -> Void {
        UIView.animateWithDuration(kAnimationDuration) { 
            if let scroll = self.scroll {
                scroll.contentInset = UIEdgeInsetsZero
            }
        }
    }
    
    //MARK: - Other functions
    
    func textFieldReturnButtonPressed(textField: UITextField) -> Void {
        self.sortTextFieldsByY()
        if let index = self.textFields.indexOf({$0 === textField}) {
            let newIndex = index + 1
            if newIndex < self.textFields.count {
                let nextTextField = self.textFields[index + 1]
                nextTextField.becomeFirstResponder()
            }
            else {
                self.hideKeyboard()
            }
        }
    }
    
    func hideKeyboard() -> Void {
        self.textFields.forEach { textField in
            textField.resignFirstResponder()
        }
    }
    
    func scrollToActiveTextField(keyboardHeight: CGFloat) -> Void {
        if let activeTextField = self.firstResponder() {
            if let scrollView = self.scroll {
                let frame = scrollView.convertRect(activeTextField.bounds,
                                                   fromView: activeTextField)
                scrollView.scrollRectToVisible(frame, animated: true)
            }
        }
    }
    
    //MARK: - Utils
    
    func firstResponder() -> UITextField? {
        self.sortTextFieldsByY()
        for textField in self.textFields {
            if textField.isFirstResponder() {
                return textField as? UITextField
            }
        }
        return nil
    }
    
    private func sortTextFieldsByY() -> Void {
        let window = UIApplication.sharedApplication().keyWindow
        let sortedArray = self.textFields.sort { (currentObject, nextObject) -> Bool in
            let currentObjectRect = currentObject.convertRect(currentObject.frame, toView: window)
            let nextObjectRect = nextObject.convertRect(nextObject.frame, toView: window)
            return currentObjectRect.origin.y < nextObjectRect.origin.y
        }
        self.textFields = sortedArray
    }
}
