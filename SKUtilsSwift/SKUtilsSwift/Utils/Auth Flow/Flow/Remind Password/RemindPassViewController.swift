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
    
    @IBOutlet var textfieldsManager: TextFieldsManager!
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
        textfieldsManager.hideKeyboard()
        let textFields = textfieldsManager.textFields as! [UITextField]
        let validated = reminderViewModel.validate(fields: textFields)
        if validated,
            let email = emailField.text {
            reminderViewModel.remindPassword(email: email)
        }
    }
    
}
