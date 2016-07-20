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
    @IBOutlet weak var emailTextField: SKBaseTextField!
    @IBOutlet weak var passTextField: SKBaseTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
           self.validateEmailTextField()
        }
        if passTextField == sender {
            self.validatePassTextField()
        }
    }
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        self.textFieldsManager.hideKeyboard()
        self.validateEmailTextField()
        self.validatePassTextField()
        self.loginVM.email = self.emailTextField.text
        self.loginVM.pass = self.passTextField.text
        self.loginVM.login()
    }
    
    func validateEmailTextField() -> Void {
        let validText = self.loginVM.isEmailValid(self.emailTextField.text)
        self.emailTextField.visualisationView!.currentViewState = SKAccessoryViewState.stateForBool(validText)
    }
    
    func validatePassTextField() -> Void {
        let validText = self.loginVM.isEmailValid(self.passTextField.text)
        self.passTextField.visualisationView!.currentViewState = SKAccessoryViewState.stateForBool(validText)
    }
}
