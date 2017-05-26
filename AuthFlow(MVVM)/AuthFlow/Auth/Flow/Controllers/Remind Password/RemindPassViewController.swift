//
//  RemindPassViewController.swift
//  GeoTouch
//
//  Created by Sergey on 09.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class RemindPassViewController: DissmisableViewController, RequestExecutingViewProtocol, TextInputsManagerProtocol {

    var remindPassNavigation = RemindPassNavigation()
    
    @IBOutlet weak var textInputsManager: TextInputsManager!
    @IBOutlet weak var emailField: EmailTextField!
    
    var reminderViewModel = RemindPassViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderViewModel.resultOfRemindPasswordRequest.bind { [weak self] (success) in
            guard let strongSelf = self else { return }
            if success {
                strongSelf.remindPassNavigation.dismiss(controller: strongSelf,
                                                        animated: true)
            }
        }
        reminderViewModel.executingHandlerForRemindPassword = requerstExecutingHandler()
    }

    @IBAction func remindButtonPresed(_ sender: UIButton) {
        hideKeyboard()
        let result = reminderViewModel.validate(email: emailField.text)
        if result.succeed == false,
            let error = result.error {

        }
    }
    
}
