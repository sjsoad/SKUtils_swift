//
//  RemindPassViewController.swift
//  GeoTouch
//
//  Created by Sergey on 09.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class RemindPassViewController: DissmisableViewController, Presentation, RequestExecutingViewProtocol {

    typealias navigationType = RemindPassNavigation
    
    @IBOutlet var textFieldsManager: TextFieldsManager!
    @IBOutlet weak var emailField: EmailTextField!
    
    var reminderViewModel = RemindPassViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderViewModel.requestSucceed.bind { [weak self] (success) in
            guard let strongSelf = self else { return }
            if success {
                navigationType.dismiss(controller: strongSelf,
                                       animated: true)
            }
        }
        reminderViewModel.requerstExecutingHandler = requerstExecutingHandler()
    }

    @IBAction func remindButtonPresed(_ sender: UIButton) {
        textFieldsManager.hideKeyboard()
        let result = reminderViewModel.validate(email: emailField.text)
        if result.succeed == false,
            let error = result.error {

        }
    }
    
}
