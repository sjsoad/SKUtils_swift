//
//  TextInputsManager.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class TextInputsManager: NSObject {
    
    @IBInspectable var hideOnTap: Bool = true
    @IBInspectable var kAnimationDuration: Double = 0.25
    @IBInspectable var additionalSpaceAboveKeyboard: CGFloat = 0.0 // no effect
    
    @IBOutlet fileprivate weak var containerView: UIView! {
        didSet {
            configureManager()
        }
    }
    
    private var textInputs = [UIView]()
    
    private func configureManager() {
        subscribeForKeyboardNotifications()
        gatherTextInputs()
        if hideOnTap == true { addTapGestureRecognizer() }
    }
    
    // MARK: - Private -
    
    private func gatherTextInputs() {
        let textFields: [UIView] = containerView.subviewsOf(type: UITextField.self).flatMap { (textField) -> UIView? in
            textField.addTarget(self, action: #selector(returnButtonPressed), for: .editingDidEndOnExit)
            return textField
        }
        let textViews: [UIView] = containerView.subviewsOf(type: UITextView.self)
        textInputs += textFields
        textInputs += textViews
    }
    
    private func addTapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.numberOfTapsRequired = 1
        tap.delegate = self
        containerView.addGestureRecognizer(tap)
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
        guard let activeInputView = firstResponder(),
            let scroll = containerView as? UIScrollView else { return }
        let frame = scroll.convert(activeInputView.bounds, from: activeInputView)
        scroll.scrollRectToVisible(frame, animated: true)
    }
    
    // MARK: - Handle keyboard notifications -
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let rect = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
            let scroll = containerView as? UIScrollView else { return }
        UIView.animate(withDuration: kAnimationDuration, animations: { [weak self] in
            guard let strongSelf = self else { return }
            // distance from screen bottom to container bottom
            let distance = UIScreen.main.bounds.maxY - scroll.frame.maxY
            let bottomInset = rect.size.height - distance
            scroll.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
            strongSelf.scrollToActiveInputView(rect.size.height)
        })
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: kAnimationDuration, animations: { [weak self] in
            guard let strongSelf = self,
                let scroll = strongSelf.containerView as? UIScrollView else { return }
            scroll.contentInset = UIEdgeInsets.zero
        })
    }
    
    @objc private func returnButtonPressed(_ textField: UITextField) {
        sortInputsByY()
        guard let index = textInputs.index(where: {$0 === textField}) else { return }
        activateField(at: index + 1)
    }
  
    private func activateField(at index: Int) {
        if textInputs.indices.contains(index) {
            let nextInputView = textInputs[index]
            if nextInputView.canBecomeFirstResponder {
                nextInputView.becomeFirstResponder()
            } else {
                activateField(at: index + 1)
            }
        } else {
            hideKeyboard()
        }
    }

}

// MARK: - KeyboardHiding -

extension TextInputsManager: KeyboardHiding {
    @objc func hideKeyboard() {
        textInputs.forEach { textInput in
            _ = textInput.resignFirstResponder()
        }
    }
}

// MARK: - TextInputsClearing -

extension TextInputsManager: TextInputsClearing {
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
}

// MARK: - TextFieldsManagerReloading -

extension TextInputsManager: TextFieldsManagerReloading {
    func reloadTextFieldsManager() {
        textInputs.removeAll()
        gatherTextInputs()
    }
}

// MARK: - FirstResponding -

extension TextInputsManager: FirstResponding {
    func firstResponder() -> UIView? {
        let textInput = textInputs.first(where: { (textField) -> Bool in
            return textField.isFirstResponder
        })
        return textInput
    }
}

// MARK: - UIGestureRecognizerDelegate -

extension TextInputsManager: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let tables: [UIView] = containerView.subviewsOf(type: UITableView.self)
        let collections: [UIView] = containerView.subviewsOf(type: UICollectionView.self)
        var subviews = [UIView]()
        subviews += tables
        subviews += collections
        for subview in subviews {
            let point = gestureRecognizer.location(in: subview)
            if subview.point(inside: point, with: nil) {
                return false
            }
        }
        return true
    }
    
}

// MARK: - UIView -

private extension UIView {
    
    func subviewsOf<T>(type: T.Type) -> [T] {
        var searchedSubviews = [T]()
        for subview in subviews {
            if let view = subview as? T {
                searchedSubviews.append(view)
            } else {
                searchedSubviews += subview.subviewsOf(type: T.self)
            }
        }
        return searchedSubviews
    }
    
}
