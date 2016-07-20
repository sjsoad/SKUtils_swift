//
//  SKLoginMV.swift
//  SKUtilsSwift
//
//  Created by Mac on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class SKLoginMV: UIViewController {
    
    @IBOutlet var loginVM: SKLoginVM!
    @IBOutlet var textFieldsManager: SKTextFieldsManager!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: SKTextFieldAccessoryView!
    @IBOutlet weak var passTextField: SKTextFieldAccessoryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldDidBeginEditing(sender: UITextField) {
        if emailTextField.textField == sender {
            emailTextField.currentViewState = .SKAccessoryViewStateActive
        }
        if passTextField.textField == sender {
            passTextField.currentViewState = .SKAccessoryViewStateActive
        }
    }
    @IBAction func textFieldDidEndEditing(sender: UITextField) {
        if emailTextField.textField == sender {
           self.validateEmailTextField()
        }
        if passTextField.textField == sender {
            self.validatePassTextField()
        }
    }
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        self.textFieldsManager.hideKeyboard()
        self.validateEmailTextField()
        self.validatePassTextField()
        self.loginVM.email = self.emailTextField.textField!.text
        self.loginVM.pass = self.passTextField.textField!.text
        self.loginVM.login()
    }
    
    func validateEmailTextField() -> Void {
        if let text = self.emailTextField.textField?.text {
            self.emailTextField.currentViewState = !self.loginVM.isPassValid(text)  ? .SKAccessoryViewStateError : .SKAccessoryViewStateSuccess
        }
    }
    
    func validatePassTextField() -> Void {
        if let text = self.passTextField.textField?.text {
                 self.passTextField.currentViewState = !self.loginVM.isPassValid(text)  ? .SKAccessoryViewStateError : .SKAccessoryViewStateSuccess
        }
    }
}
