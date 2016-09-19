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
import SWMessages

class SKLoginMV: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet var loginVM: SKLoginVM!
    @IBOutlet var textFieldsManager: TextFieldsManager!
    
    @IBOutlet weak var loginButton: PopOnEnableButton!
    @IBOutlet weak var emailTextField: BaseTextField!
    @IBOutlet weak var passTextField: BaseTextField!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.locationSerice.startLocationService()
        
        self.loginVM.setupWith(emailTextField.rx_controlEvent(.editingDidEnd),
                               passwordTextFieldDidEndEditing: passTextField.rx_controlEvent(.editingDidEnd),
                               emailString: emailTextField.rx_text.asObservable(),
                               passString: passTextField.rx_text.asObservable(),
                               loginButtonTap: loginButton.rx_tap.asObservable())
        
        self.loginVM.canLogin.subscribeNext { [weak self] canLogin in
            self?.loginButton.isEnabled = canLogin
        }.addDisposableTo(disposeBag)
        
        self.loginVM.emailValidation.subscribeNext { [weak self] emailValid in
            self?.proceedTextField(self!.emailTextField, valid: emailValid)
            }.addDisposableTo(disposeBag)
        
        self.loginVM.passValidation.subscribeNext { [weak self] passValid in
            self?.proceedTextField(self!.passTextField, valid: passValid)
            }.addDisposableTo(disposeBag)
        
        self.loginVM.loggedIn.subscribe(
            onNext: { success in
                self.stopActivityAnimating()
                if success {
                    print("success");
                }
                else {
                    SWMessage.sharedInstance.showNotificationInViewController(self,
                        title: "Error",
                        subtitle: "For some reasons you cannot login. Try later.",
                        type: .error,
                        duration: .custom(1),
                        canBeDismissedByUser: false)
                }
            }).addDisposableTo(disposeBag)
    }
    
    func proceedTextField(_ textField: BaseTextField, valid: Bool) -> Void {
        if let view = textField.visualisationView {
            view.currentViewState = AccessoryViewState.stateForBool(valid)
            if !valid {
                self.animateActionOnTextField(view)
            }
        }
    }
    
    @IBAction func resetTextField(_ textField: BaseTextField) {
        if let view = textField.visualisationView {
            view.currentViewState = .accessoryViewStateActive
        }
    }

    @IBAction func loginButtonPressed(_ sender: AnyObject) {
        self.textFieldsManager.hideKeyboard()
        self.startActivityAnimating(CGSize(width: 80, height: 30),
                                     message: nil,
                                     type: .ballClipRotate,
                                     color: UIColor.white,
                                     padding: 0)
    }
    //Animation
    
    func animateActionOnTextField(_ view: SpringView) -> Void {
        view.animation = "shake"
        view.curve = "easeOut"
        view.delay = CGFloat.random(0.0, max: 0.2)
        view.force = CGFloat.random(0.05, max: 0.2)
        view.duration = CGFloat.random(0.3, max: 0.5)
        view.animate()
    }
}
