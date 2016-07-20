//
//  SKLoginMV.swift
//  SKUtilsSwift
//
//  Created by Mac on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import Spring
import NVActivityIndicatorView

protocol SKLoginDelegate {
    func validateEmailTextField(valid: Bool) -> Void
    func validatePassTextField(valid: Bool) -> Void
}

class SKLoginMV: UIViewController, NVActivityIndicatorViewable, SKLoginDelegate {
    
    @IBOutlet var loginVM: SKLoginVM! {
        didSet {
            self.loginVM.delegate = self
        }
    }
    @IBOutlet var textFieldsManager: SKTextFieldsManager!
    
    @IBOutlet weak var loginButton: SpringButton!
    @IBOutlet weak var emailTextField: SKBaseTextField!
    @IBOutlet weak var passTextField: SKBaseTextField!
    
    @IBAction func textFieldDidBeginEditing(sender: UITextField) {
        if emailTextField == sender {
            emailTextField.visualisationView!.currentViewState = .SKAccessoryViewStateActive
        }
        if passTextField == sender {
            passTextField.visualisationView!.currentViewState = .SKAccessoryViewStateActive
        }
    }
    @IBAction func textFieldDidEndEditing(sender: UITextField) {
        if emailTextField == sender {
           self.loginVM.isEmailValid(self.emailTextField.text)
        }
        if passTextField == sender {
            self.loginVM.isPassValid(self.passTextField.text)
        }
    }
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        self.animateLoginButton()
        self.textFieldsManager.hideKeyboard()
        self.loginVM.isEmailValid(self.emailTextField.text)
        self.loginVM.isPassValid(self.passTextField.text)
        if self.loginVM.canTryToLogin {
            self.loginVM.email = self.emailTextField.text
            self.loginVM.pass = self.passTextField.text
            startActivityAnimating(CGSizeMake(80, 30), message: nil, type: .BallClipRotate, color: UIColor.whiteColor(), padding: 0)
            self.loginVM.login()
        }
    }
    
    //Delegate
    
    func validateEmailTextField(valid: Bool) -> Void {
        if !valid {
            self.animateActionOnTextField(self.emailTextField.visualisationView!)
        }
        self.emailTextField.visualisationView!.currentViewState = SKAccessoryViewState.stateForBool(valid)
    }
    
    func validatePassTextField(valid: Bool) -> Void {
        if !valid {
            self.animateActionOnTextField(self.passTextField.visualisationView!)
        }
        self.passTextField.visualisationView!.currentViewState = SKAccessoryViewState.stateForBool(valid)
    }
    
    //Animation
    
    func animateLoginButton() -> Void {
        self.loginButton.animation = "pop"
        self.loginButton.curve = "easeOut"
        self.loginButton.force = CGFloat.random(0.1, max: 0.2)
        self.loginButton.duration = CGFloat.random(0.3, max: 0.5)
        self.loginButton.animate()
    }
    
    func animateActionOnTextField(view: SpringView) -> Void {
        view.animation = "shake"
        view.curve = "easeOut"
        view.delay = CGFloat.random(0.0, max: 0.2)
        view.force = CGFloat.random(0.05, max: 0.2)
        view.duration = CGFloat.random(0.3, max: 0.5)
        view.animate()
    }
}
