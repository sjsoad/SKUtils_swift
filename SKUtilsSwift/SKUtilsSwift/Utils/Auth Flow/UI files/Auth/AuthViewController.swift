//
//  AuthViewController.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class AuthViewController: UIViewController, RequestExecutingViewProtocol {

    typealias navigationType = AuthNavigation
        
    var authViewModel = AuthViewModel()
    var profileViewModel = ProfileViewModel()
    
    @IBOutlet var textfieldsManager: TextFieldsManager!
    @IBOutlet weak var emailField: EmailTextField!
    @IBOutlet weak var passwordField: PassTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroModalAnimationType = .auto
        authViewModel.requestSucceed.bind { [weak self](succeed) in
            guard let strongSelf = self else { return }
            if succeed {
                if let authCredentials = strongSelf.authViewModel.authCredentials {
                    strongSelf.profileViewModel.profile(authCredentials: authCredentials)
                }
            }
        }
        profileViewModel.requestSucceed.bind { [weak self](succeed) in
            guard let strongSelf = self else { return }
            strongSelf.authViewModel.tryToLogin = false
            if succeed,
                let profile = strongSelf.profileViewModel.profile {
                navigationType.pushMain(auth: strongSelf.authViewModel.authCredentials,
                                        profile: profile,
                                        from: strongSelf,
                                        animated: profile.hasPalces(),
                                        takePhoto: !profile.hasPalces())
            }
        }
        authViewModel.requerstExecutingHandler = requerstExecutingHandler()
        profileViewModel.requerstExecutingHandler = requerstExecutingHandler()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if authViewModel.tryToLogin {
            tryTologin()
        }
    }
    
    //MARK: - Action
    
    func tryTologin() {
        textfieldsManager.hideKeyboard()
        let textFields = textfieldsManager.textFields as! [UITextField]
        let validated = authViewModel.validate(fields: textFields)
        if validated,
            let email = emailField.text,
            let password = passwordField.text {
            authViewModel.login(email: email,
                                password: password)
        }
    }
    
    //MARK: - IBAction
 
    @IBAction func facebookButtonPressed(_ sender: UIButton) {
        authViewModel.loginWithFacebook(fromController: self)
    }
    
    @IBAction func instagramButtonPressed(_ sender: UIButton) {
        authViewModel.loginWithInstagram(fromController: self)
    }
    
    @IBAction func googlePlusButtonPressed(_ sender: UIButton) {
        authViewModel.loginWithGooglePlus(fromController: self)
    }
    
    @IBAction func aboutUsButtonPressed(_ sender: UIButton) {
        navigationType.presentAbout(from: self)
    }
    
    @IBAction func registrationButtonPressed(_ sender: UIButton) {
        navigationType.pushRegistration(from: self,
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
