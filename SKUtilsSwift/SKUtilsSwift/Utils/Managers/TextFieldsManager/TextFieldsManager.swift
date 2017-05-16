//
//  SKTextFieldsManager.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class TextFieldsManager: NSObject, UIGestureRecognizerDelegate {
    
    var textFields : [UITextField] = Array()
    
    @IBOutlet var scroll : UIScrollView? = nil {
        didSet {
            getTextFieldsInView(scroll)
            addTapGestureRecognizer()
        }
    }
    
    @IBInspectable var hideOnTap : Bool = true
    @IBInspectable var kAnimationDuration = 0.25
    @IBInspectable var additionalSpaceAboveKeyboard : CGFloat = 0.0
    
    override init() {
        super.init()
        subscribeForKeyboardNotifications()
    }
    
    //MARK: - Getting UITextFields
    
    func getTextFieldsInView(_ view: UIView?) {
        guard let view = view else { return }
        for subView in view.subviews {
            if let textField = subView as? UITextField {
                textField.addTarget(self,
                                    action: #selector(TextFieldsManager.returnButtonPressed),
                                    for: UIControlEvents.editingDidEndOnExit)
                textFields.append(textField)
            }
            else {
                getTextFieldsInView(subView)
            }
        }
    }
    
    //MARK: - Set hide keyboard on tap
    
    func addTapGestureRecognizer() {
        guard let scroll = scroll else { return }
        if hideOnTap {
            let tap = UITapGestureRecognizer(target: self,
                                             action: #selector(TextFieldsManager.hideKeyboard))
            scroll.addGestureRecognizer(tap)
        }
    }
    
    //MARK: - Subscribe for keyboard notifications
    
    func subscribeForKeyboardNotifications() {
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
    
    func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let rect = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        UIView.animate(withDuration: kAnimationDuration, animations: { [weak self] in
            guard let strongSelf = self else { return }
            guard let scroll = strongSelf.scroll else { return }
            scroll.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
            strongSelf.scrollToActiveTextField(rect.size.height)
        })
    }
    
    func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: kAnimationDuration, animations: { [weak self] in
            guard let strongSelf = self else { return }
            guard let scroll = strongSelf.scroll else { return }
            scroll.contentInset = UIEdgeInsets.zero
        })
    }
    
    //MARK: - Other functions
    
     func returnButtonPressed(_ textField: UITextField) {
        sortTextFieldsByY()
        if let index = self.textFields.index(where: {$0 === textField}) {
            let newIndex = index + 1
            if newIndex < self.textFields.count {
                let nextTextField = self.textFields[newIndex]
                _ = nextTextField.becomeFirstResponder()
            }
            else {
                hideKeyboard()
            }
        }
    }
    
    func hideKeyboard() {
        textFields.forEach { textField in
            _ = textField.resignFirstResponder()
        }
    }
    
    fileprivate func scrollToActiveTextField(_ keyboardHeight: CGFloat) {
        guard let activeTextField = firstResponder() else { return }
        guard let scroll = scroll else { return }
        let frame = scroll.convert(activeTextField.bounds,
                                   from: activeTextField)
        scroll.scrollRectToVisible(frame, animated: true)
    }

    //MARK: - Utils

    func clearTextField() {
        for field in textFields {
            field.text = nil
        }
    }
    
    func firstResponder() -> UITextField? {
        sortTextFieldsByY()
        for textField in textFields {
            if textField.isFirstResponder {
                return textField
            }
        }
        return nil
    }
    
    fileprivate func sortTextFieldsByY() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let sortedArray = textFields.sorted { (currentObject, nextObject) -> Bool in
            let currentObjectRect = currentObject.convert(currentObject.frame, to: window)
            let nextObjectRect = nextObject.convert(nextObject.frame, to: window)
            return currentObjectRect.origin.y < nextObjectRect.origin.y
        }
        textFields = sortedArray
    }
}
