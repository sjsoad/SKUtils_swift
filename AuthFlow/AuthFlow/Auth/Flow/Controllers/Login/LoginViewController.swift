//
//  AuthViewController.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController, RequestExecutingViewProtocol, GoogleAuthViewControllerProtocol, LoginProcessingProtocol {

    typealias navigationType = LoginNavigation
    
    var loginProcessor: LoginProcessorProtocol?
    
    var loginViewModel = LoginViewModel()
    var profileViewModel = ProfileViewModel()
    
    @IBOutlet var textFieldsManager: TextFieldsManager!
    @IBOutlet weak var emailField: EmailTextField!
    @IBOutlet weak var passwordField: PassTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.requestSucceed.bind { [weak self](succeed) in
            guard let strongSelf = self else { return }
            if succeed,
                let processor = strongSelf.loginProcessor {
                strongSelf.textFieldsManager.clearTextField()
                processor.process(viewModel: strongSelf.loginViewModel)
            }
        }
        loginViewModel.requerstExecutingHandler = requerstExecutingHandler()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if loginViewModel.tryToLogin {
            tryTologin()
            loginViewModel.tryToLogin = false
        }
    }
    
    //MARK: - Action
    
    func tryTologin() {
        textFieldsManager.hideKeyboard()
        let textFields = textFieldsManager.textFields as! [UITextField]
        let validated = loginViewModel.validate(fields: textFields)
        if validated,
            let email = emailField.text,
            let password = passwordField.text {
            loginViewModel.login(email: email,
                                password: password)
        }
    }
    
    //MARK: - IBAction
 
    @IBAction func facebookButtonPressed(_ sender: UIButton) {
        loginViewModel.loginWithFacebook(fromController: self)
    }
    
    @IBAction func instagramButtonPressed(_ sender: UIButton) {
        loginViewModel.loginWithInstagram(fromController: self)
    }
    
    @IBAction func googlePlusButtonPressed(_ sender: UIButton) {
        loginViewModel.loginWithGooglePlus(fromController: self)
    }
    
    @IBAction func registrationButtonPressed(_ sender: UIButton) {
        navigationType.moveToRegistration(loginProcessor: loginProcessor,
                                          from: self,
                                          animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        tryTologin()
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        navigationType.presentPasswordReminder(from: self,
                                               animated: true)
    }
}
