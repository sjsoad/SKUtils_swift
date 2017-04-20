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
    
    @IBOutlet var textfieldsManager: TextFieldsManager!
    @IBOutlet weak var passwordField: PassTextField!
    @IBOutlet weak var confirmationField: PassTextField!
    
    var changePassViewModel = ChangePassViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changePassViewModel.requestSucceed.bind { [weak self] (success) in
            guard let strongSelf = self else { return }
            if success {
                navigationType.dismiss(controller: strongSelf,
                                       animated: true)
            }
        }
        changePassViewModel.requerstExecutingHandler = requerstExecutingHandler()
        // Do any additional setup after loading the view.
    }

    //MARK: - IBActions
    
    @IBAction func changeButtonPresed(_ sender: UIButton) {
        textfieldsManager.hideKeyboard()
        let textFields = textfieldsManager.textFields as! [UITextField]
        let validated = changePassViewModel.validate(fields: textFields)
        if validated,
            let token = changePassViewModel.temporaryToken {
            let validated = changePassViewModel.validate(equal: passwordField,
                                                         to: confirmationField,
                                                         comparisonHandler: nil)
            if validated,
                let password = passwordField.text {
                changePassViewModel.changePassword(password: password,
                                                   token: token)
            }
        }
    }
    
}
