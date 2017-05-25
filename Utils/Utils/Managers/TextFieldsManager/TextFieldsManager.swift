//
//  SKTextFieldsManager.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class TextFieldsManager: NSObject, UIGestureRecognizerDelegate {
    
    private var textInputs = [UIView]()
    
    @IBOutlet private weak var scroll: UIScrollView? = nil {
        didSet {
            getTextFieldsInView(scroll)
            addTapGestureRecognizer()
        }
    }
    
    @IBInspectable var hideOnTap: Bool = true
    @IBInspectable var kAnimationDuration: Double = 0.25
    @IBInspectable var additionalSpaceAboveKeyboard: CGFloat = 0.0 // no effect
    
    override init() {
        super.init()
        subscribeForKeyboardNotifications()
    }
    
    // MARK: - Getting UITextFields
    
    private func getTextFieldsInView(_ view: UIView?) {
        guard let view = view else { return }
        for subView in view.subviews {
            if let textField = subView as? UITextField {
                textField.addTarget(self,
                                    action: #selector(TextFieldsManager.returnButtonPressed),
                                    for: UIControlEvents.editingDidEndOnExit)
                textInputs.append(textField)
                
            } else if let textView = subView as? UITextView {
                textInputs.append(textView)
            } else {
                getTextFieldsInView(subView)
            }
        }
    }
    
    // MARK: - Private -
    
    private func addTapGestureRecognizer() {
        guard let scroll = scroll else { return }
        if hideOnTap {
            let tap = UITapGestureRecognizer(target: self,
                                             action: #selector(hideKeyboard))
            scroll.addGestureRecognizer(tap)
        }
    }
    
    private func subscribeForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    private func sortTextFieldsByY() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let sortedArray = textInputs.sorted { (currentObject, nextObject) -> Bool in
            let currentObjectRect = currentObject.convert(currentObject.frame, to: window)
            let nextObjectRect = nextObject.convert(nextObject.frame, to: window)
            return currentObjectRect.origin.y < nextObjectRect.origin.y
        }
        textInputs = sortedArray
    }
    
    private func scrollToActiveInputView(_ keyboardHeight: CGFloat) {
        guard let activeInputView = firstResponder(),
            let scroll = scroll else { return }
        let frame = scroll.convert(activeInputView.bounds,
                                   from: activeInputView)
        scroll.scrollRectToVisible(frame, animated: true)
    }
    
    // MARK: - Handle keyboard notifications -
    
    func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let rect = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        UIView.animate(withDuration: kAnimationDuration, animations: { [weak self] in
            guard let strongSelf = self,
                let scroll = strongSelf.scroll else { return }
            scroll.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
            strongSelf.scrollToActiveInputView(rect.size.height)
        })
    }
    
    func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: kAnimationDuration, animations: { [weak self] in
            guard let strongSelf = self,
                let scroll = strongSelf.scroll else { return }
            scroll.contentInset = UIEdgeInsets.zero
        })
    }
    
    func returnButtonPressed(_ textField: UITextField) {
        sortTextFieldsByY()
        if let index = self.textInputs.index(where: {$0 === textField}) {
            let newIndex = index + 1
            if newIndex < self.textInputs.count {
                let nextInputView = self.textInputs[newIndex]
                _ = nextInputView.becomeFirstResponder()
            } else {
                hideKeyboard()
            }
        }
    }

    // MARK: - Public

    func hideKeyboard() {
        textInputs.forEach { textField in
            _ = textField.resignFirstResponder()
        }
    }
    
    func clearTextField() {
        for field in textInputs {
            if let textField = field as? UITextField {
             textField.text = nil
            }
            if let textView = field as? UITextView {
                textView.text = ""
            }
        }
    }
    
    func firstResponder() -> UIView? {
        let textInput = textInputs.first(where: { (textField) -> Bool in
            return textField.isFirstResponder
        })
        return textInput
    }
    
}
