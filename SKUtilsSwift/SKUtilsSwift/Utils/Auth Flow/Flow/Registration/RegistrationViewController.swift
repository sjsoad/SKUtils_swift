//
//  RegistrationViewController.swift
//  GeoTouch
//
//  Created by Sergey on 07.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, RequestExecutingViewProtocol {
    
    typealias navigationType = RegistrationNavigation
    
    var registrationViewModel = RegistrationViewModel()
    
    @IBOutlet var textfieldsManager: TextFieldsManager!
    @IBOutlet weak var username: BaseTextField!
    @IBOutlet weak var emailField: EmailTextField!
    @IBOutlet weak var passwordField: PassTextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
//        if let scroll = textfieldsManager.scroll {
//            let contentInset = UIEdgeInsetsMake(self.navigationController!.navigationBar.frame.size.height,
//                                                0,
//                                                0,
//                                                0)
//            scroll.contentInset = contentInset
//            scroll.scrollIndicatorInsets = contentInset
//        }
        registrationViewModel.requestSucceed.bind { [weak self] (registrationSucceed) in
            guard let strongSelf = self else { return }
            if registrationSucceed,
                let email = strongSelf.emailField.text,
                let password = strongSelf.passwordField.text{
                navigationType.popToAuth(login: true,
                                         email: email,
                                         password: password,
                                         from: strongSelf)
            }
        }
        registrationViewModel.requerstExecutingHandler = requerstExecutingHandler()
    }
    
    //MARK: - IBActions
    
    @IBAction func registrationButtonPresed(_ sender: UIButton) {
        textfieldsManager.hideKeyboard()
        let textFields = textfieldsManager.textFields as! [UITextField]
        let validated = registrationViewModel.validate(fields: textFields)
        if validated,
            let username = username.text,
            let email = emailField.text,
            let password = passwordField.text {
            registrationViewModel.register(email: email,
                                           nickname: username,
                                           password: password)
        }
    }
}
