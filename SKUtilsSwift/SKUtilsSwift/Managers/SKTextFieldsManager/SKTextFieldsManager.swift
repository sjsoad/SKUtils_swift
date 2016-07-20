//
//  SKTextFieldsManager.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

let kAnimationDuration = 0.25

class SKTextFieldsManager: NSObject, UIGestureRecognizerDelegate {

    var textFields : [AnyObject] = Array()

    @IBOutlet var scroll : UIScrollView? = nil {
        didSet {
            self.getTextFieldsInView(scroll)
            self.addTapGestureRecognizer()
        }
    }
    @IBInspectable var hideOnTap : Bool = true
    @IBInspectable var additionalSpaceAboveKeyboard : CGFloat = 0.0
    
    override init() {
        super.init()
        self.subscribeForKeyboardNotifications()
    }
    
    func addTapGestureRecognizer() -> Void {
        if self.hideOnTap {
            let tap = UITapGestureRecognizer(target: self, action: #selector(SKTextFieldsManager.hideKeyboard))
            if let scroll = self.scroll {
                scroll.addGestureRecognizer(tap)
            }
        }
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
        if let rect = notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue() {
            UIView.animateWithDuration(kAnimationDuration) {
                if let scroll = self.scroll {
                    scroll.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
                    self.scrollToTextField(rect.size.height)
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
    
    func firstResponder() -> UITextField? {
        self.sortTextFieldsByY()
        for textField in self.textFields {
            if textField.isFirstResponder() {
                return textField as? UITextField
            }
        }
        return nil
    }
    
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
    
    func scrollToTextField(keyboardHeight: CGFloat) -> Void {
        if let activeTextField = self.firstResponder() {
            if let window = UIApplication.sharedApplication().keyWindow {
                let activeTextFieldRect = activeTextField.convertRect(activeTextField.frame, toView: window)
                var visibleRect = window.frame
                visibleRect.size.height = visibleRect.size.height - keyboardHeight
                if !CGRectContainsRect(visibleRect, activeTextFieldRect) {
                    if let scroll = self.scroll {
                        let y = scroll.contentOffset.y + activeTextFieldRect.origin.y + activeTextFieldRect.size.height - visibleRect.size.height + self.additionalSpaceAboveKeyboard
                        let pointToScroll = CGPointMake(0, y);
                        scroll.setContentOffset(pointToScroll, animated: false)
                    }
                }
            }
        }
    }
    
    private func sortTextFieldsByY() -> Void {
        let window = UIApplication.sharedApplication().keyWindow
        let sortedArray = self.textFields.sort { (object1, object2) -> Bool in
            let obj1Rect = object1.convertRect(object1.frame, toView: window)
            let obj2Rect = object1.convertRect(object2.frame, toView: window)
            return obj1Rect.origin.y > obj2Rect.origin.y
        }
        self.textFields = sortedArray
    }
}
