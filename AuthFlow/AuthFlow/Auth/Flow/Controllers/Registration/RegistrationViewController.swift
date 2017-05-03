//
//  RegistrationViewController.swift
//  GeoTouch
//
//  Created by Sergey on 07.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, RequestExecutingViewProtocol, LoginProcessingProtocol {
    
    typealias navigationType = RegistrationNavigation
    
    var loginProcessor: LoginProcessorProtocol?
    
    var registrationViewModel = RegistrationViewModel()
    
    @IBOutlet var textFieldsManager: TextFieldsManager!
    @IBOutlet weak var username: BaseTextField!
    @IBOutlet weak var emailField: EmailTextField!
    @IBOutlet weak var passwordField: PassTextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        registrationViewModel.requestSucceed.bind { [weak self] (registrationSucceed) in
            guard let strongSelf = self else { return }
            if registrationSucceed,
                let email = strongSelf.emailField.text,
                let password = strongSelf.passwordField.text {
                navigationType.moveToAuth(loginProcessor: strongSelf.loginProcessor,
                                          email: email,
                                          password: password,
                                          from: strongSelf,
                                          animated: true)
                strongSelf.textFieldsManager.clearTextField()
            }
        }
        registrationViewModel.requerstExecutingHandler = requerstExecutingHandler()
    }
    
    //MARK: - IBActions
    
    @IBAction func registrationButtonPresed(_ sender: UIButton) {
        textFieldsManager.hideKeyboard()
        let result = registrationViewModel.validate(email: emailField.text,
                                                    password: passwordField.text,
                                                    username: username.text)
        if result.succeed == false,
            let error = result.error {

        }
    }
}
