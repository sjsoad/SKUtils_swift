//
//  TextInputsManager.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class TextInputsManager: NSObject, TextInputsManaging {
    
    @IBInspectable var hideOnTap: Bool = true
    @IBInspectable var kAnimationDuration: Double = 0.25
    @IBInspectable var additionalSpaceAboveKeyboard: CGFloat = 0.0 // no effect
    
    @IBOutlet private weak var scroll: UIScrollView! {
        didSet {
            configureManager()
        }
    }
    
    private var textInputs = [UIView]()
    
    private func configureManager() {
        subscribeForKeyboardNotifications()
        textInputsInView(scroll)
        if hideOnTap == true { addTapGestureRecognizer() }
    }
    
    // MARK: - Getting Inputs
    
    private func textInputsInView(_ view: UIView) {
        for subView in view.subviews {
            if let textField = subView as? UITextField {
                textField.addTarget(self, action: #selector(returnButtonPressed), for: .editingDidEndOnExit)
                textInputs.append(textField)
            } else if let textView = subView as? UITextView {
                textInputs.append(textView)
            } else {
                textInputsInView(subView)
            }
        }
    }
    
    // MARK: - Private -
    
    private func addTapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scroll.addGestureRecognizer(tap)
    }
    
    private func subscribeForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: .UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: .UIKeyboardWillHide,
                                               object: nil)
    }
    
    private func sortInputsByY() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let sortedArray = textInputs.sorted { (currentObject, nextObject) -> Bool in
            let currentObjectRect = currentObject.convert(currentObject.frame, to: window)
            let nextObjectRect = nextObject.convert(nextObject.frame, to: window)
            return currentObjectRect.origin.y < nextObjectRect.origin.y
        }
        textInputs = sortedArray
    }
    
    private func scrollToActiveInputView(_ keyboardHeight: CGFloat) {
        guard let activeInputView = firstResponder() else { return }
        let frame = scroll.convert(activeInputView.bounds, from: activeInputView)
        scroll.scrollRectToVisible(frame, animated: true)
    }
    
    // MARK: - Handle keyboard notifications -
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let rect = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        UIView.animate(withDuration: kAnimationDuration, animations: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.scroll.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: rect.size.height, right: 0)
            strongSelf.scrollToActiveInputView(rect.size.height)
        })
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: kAnimationDuration, animations: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.scroll.contentInset = UIEdgeInsets.zero
        })
    }
    
    @objc private func returnButtonPressed(_ textField: UITextField) {
        sortInputsByY()
        if let index = textInputs.index(where: {$0 === textField}) {
            let newIndex = index + 1
            if newIndex < textInputs.count {
                let nextInputView = textInputs[newIndex]
                _ = nextInputView.becomeFirstResponder()
            } else {
                hideKeyboard()
            }
        }
    }
    
    // MARK: - TextInputsManagerInterface -
    
    func hideKeyboard() {
        textInputs.forEach { textInput in
            _ = textInput.resignFirstResponder()
        }
    }
    
    func clearTextInputs() {
        for field in textInputs {
            if let textField = field as? UITextField {
                textField.text = nil
            }
            if let textView = field as? UITextView {
                textView.text = ""
            }
        }
    }
    
    func reloadTextFieldsManager() {
        textInputs.removeAll()
        textInputsInView(scroll)
    }
    
    func firstResponder() -> UIView? {
        let textInput = textInputs.first(where: { (textField) -> Bool in
            return textField.isFirstResponder
        })
        return textInput
    }
    
}
