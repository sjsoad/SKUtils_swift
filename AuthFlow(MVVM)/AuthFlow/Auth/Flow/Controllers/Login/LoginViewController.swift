//
//  AuthViewController.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController,
RequestExecutingViewProtocol, GoogleAuthViewControllerProtocol, LoginProcessingProtocol, TextInputsManagerProtocol {
    
    let loginNavigation = LoginNavigation()
    var loginProcessor: LoginProcessorProtocol?
    
    var loginViewModel = LoginViewModel()
    var profileViewModel = ProfileViewModel()
    
    @IBOutlet var textInputsManager: TextInputsManager!
    
    @IBOutlet weak var emailField: EmailTextField!
    @IBOutlet weak var passwordField: PassTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.resultOfLoginRequest.bind { [weak self] (succeed) in
            guard let strongSelf = self else { return }
            if succeed,
                let processor = strongSelf.loginProcessor {
                strongSelf.textInputsManager.clearTextInputs()
                processor.process(viewModel: strongSelf.loginViewModel)
            }
        }
        loginViewModel.executingHandlerForLogin = requerstExecutingHandler()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if loginViewModel.tryToLogin {
            tryTologin()
        }
    }
    
    // MARK: - Action
    
    func tryTologin() {
        hideKeyboard()
//        textFieldsManager.hideKeyboard()
        let result = loginViewModel.validate(email: emailField.text,
                                             password: passwordField.text)
        if result.succeed == false,
            let error = result.error {
        }
        
    }
    
    // MARK: - IBAction
    
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
        loginNavigation.moveToRegistration(loginProcessor: loginProcessor,
                                           from: self,
                                           animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        tryTologin()
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        loginNavigation.presentPasswordReminder(from: self,
                                                animated: true)
    }
}
