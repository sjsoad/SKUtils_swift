//
//  ChangePassViewController.swift
//  GeoTouch
//
//  Created by Sergey on 09.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ChangePassViewController: DissmisableViewController, Presentation, RequestExecutingViewProtocol {

    typealias navigationType = ChangePassNavigation
    
    @IBOutlet var textFieldsManager: TextFieldsManager!
    @IBOutlet weak var passwordField: PassTextField!
    @IBOutlet weak var confirmationField: PassTextField!
    
    var changePassViewModel = ChangePassViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changePassViewModel.resultOfChangePasswordRequest.bind { [weak self] (success) in
            guard let strongSelf = self else { return }
            if success {
                navigationType.dismiss(controller: strongSelf,
                                       animated: true)
            }
        }
        changePassViewModel.executingHandlerForChangePassword = requerstExecutingHandler()
        // Do any additional setup after loading the view.
    }

    //MARK: - IBActions
    
    @IBAction func changeButtonPresed(_ sender: UIButton) {
        textFieldsManager.hideKeyboard()
        let result = changePassViewModel.validate(password: passwordField.text,
                                                  confirmation: confirmationField.text)
        if result.succeed == false,
            let error = result.error {
            
        }
    }
    
}
