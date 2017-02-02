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
    
    func getTextFieldsInView(_ view: UIView?) -> Void {
        if let parent = view {
            for subView in parent.subviews {
                if subView.isKind(of: UITextField.self) {
                    let textField = subView as! UITextField
                    textField.addTarget(self,
                                        action: #selector(TextFieldsManager.returnButtonPressed),
                                        for: UIControlEvents.editingDidEndOnExit)
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
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TextFieldsManager.keyboardWillShow),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TextFieldsManager.keyboardWillHide),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    //MARK: - Handle keyboard notifications
    
    func keyboardWillShow(_ notification: Notification) -> Void {
        if let rect = ((notification as NSNotification).userInfo![UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue {
            UIView.animate(withDuration: kAnimationDuration, animations: {
                if let scroll = self.scroll {
                    scroll.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
                    self.scrollToActiveTextField(rect.size.height)
                }
            })
        }
    }
    
    func keyboardWillHide(_ notification: Notification) -> Void {
        UIView.animate(withDuration: kAnimationDuration, animations: {
            if let scroll = self.scroll {
                scroll.contentInset = UIEdgeInsets.zero
            }
        })
    }
    
    //MARK: - Other functions
    
     func returnButtonPressed(_ textField: UITextField) -> Void {
        self.sortTextFieldsByY()
        if let index = self.textFields.index(where: {$0 === textField}) {
            let newIndex = index + 1
            if newIndex < self.textFields.count {
                let nextTextField = self.textFields[index + 1]
                _ = nextTextField.becomeFirstResponder()
            }
            else {
                self.hideKeyboard()
            }
        }
    }
    
    func hideKeyboard() -> Void {
        self.textFields.forEach { textField in
            _ = textField.resignFirstResponder()
        }
    }
    
    fileprivate func scrollToActiveTextField(_ keyboardHeight: CGFloat) -> Void {
        if let activeTextField = self.firstResponder() {
            if let scrollView = self.scroll {
                let frame = scrollView.convert(activeTextField.bounds,
                                               from: activeTextField)
                scrollView.scrollRectToVisible(frame, animated: true)
            }
        }
    }
    
    //MARK: - Utils
    
    func firstResponder() -> UITextField? {
        self.sortTextFieldsByY()
        for textField in self.textFields {
            if textField.isFirstResponder ?? true {
                return textField as? UITextField
            }
        }
        return nil
    }
    
    fileprivate func sortTextFieldsByY() -> Void {
        let window = UIApplication.shared.keyWindow
        let sortedArray = self.textFields.sorted { (currentObject, nextObject) -> Bool in
            let currentObjectRect = currentObject.convert(currentObject.frame, to: window)
            let nextObjectRect = nextObject.convert(nextObject.frame, to: window)
            return currentObjectRect.origin.y < nextObjectRect.origin.y
        }
        self.textFields = sortedArray
    }
}
