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
import RxCocoa
import RxSwift

class SKLoginMV: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet var loginVM: SKLoginVM!
    @IBOutlet var textFieldsManager: SKTextFieldsManager!
    
    @IBOutlet weak var loginButton: SpringButton!
    @IBOutlet weak var emailTextField: SKBaseTextField!
    @IBOutlet weak var passTextField: SKBaseTextField!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginVM.setupWith(emailTextField.rx_controlEvent(.EditingDidEnd),
                               passwordTextFieldDidEndEditing: passTextField.rx_controlEvent(.EditingDidEnd),
                               emailString: emailTextField.rx_text.asObservable(),
                               passString: passTextField.rx_text.asObservable(),
                               loginButtonTap: loginButton.rx_tap.asObservable())
        self.loginVM.canLogin.subscribeNext { [weak self] canLogin in
            if canLogin {
                self?.animateLoginButton()
            }
            self?.loginButton.enabled = canLogin
        }.addDisposableTo(disposeBag)
        
        self.loginVM.emailValidation.subscribeNext { [weak self] emailValid in
            self?.proceedTextField(self!.emailTextField, valid: emailValid)
            }.addDisposableTo(disposeBag)
        
        self.loginVM.passValidation.subscribeNext { [weak self] passValid in
            self?.proceedTextField(self!.passTextField, valid: passValid)
            }.addDisposableTo(disposeBag)
        
        self.loginVM.logining.subscribeNext { [weak self] logining in
            self?.textFieldsManager.hideKeyboard()
            if logining {
                self!.startActivityAnimating(CGSizeMake(80, 30),
                    message: nil,
                    type: .BallClipRotate,
                    color: UIColor.whiteColor(),
                    padding: 0)
            }
            else {
                self!.stopActivityAnimating()
            }
        }.addDisposableTo(disposeBag)
    }
    
    func proceedTextField(textField: SKBaseTextField, valid: Bool) -> Void {
        if let view = textField.visualisationView {
            view.currentViewState = SKAccessoryViewState.stateForBool(valid)
            if !valid {
                self.animateActionOnTextField(view)
            }
        }
    }
    
    @IBAction func resetTextField(textField: SKBaseTextField) {
        if let view = textField.visualisationView {
            view.currentViewState = .SKAccessoryViewStateActive
        }
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
