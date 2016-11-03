//
//  ExampleViewController.swift
//  SKUtilsSwift
//
//  Created by Mac on 02.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    var imagePicker: ImagePicker = {
        let alertConfiguration = AlertConfigurator(title: "Service",
                                                   message: "Service is disabled! Please turn on it in Settings",
                                                   settingsButtonTitle: "Go to Settings",
                                                   cancelButtonTitle: "Cancel")
        let cameraPermissions = CameraPermissions(settingAlertConfiguration: alertConfiguration)
        let libraryPermissions = PhotoLibraryPermissions(settingAlertConfiguration: alertConfiguration)
        let imagePicker = ImagePicker(configurationHandler: {picker in
            print(picker)
        },
                                      cameraPermissions: cameraPermissions,
                                      libraryPermissions: libraryPermissions)
        imagePicker.imagePickerController.delegate = imagePicker
        return imagePicker
    }()
    
    var mailComposer = MailHelper.mailComposer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.configurationHandler = {picker in
            print(picker)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imagePickerButtonPressed(_ sender: Any) {
        imagePicker.show(selectionHandler: nil,
                         cancelHandler: nil,
                         completionHandler: nil)
    }
    
    @IBAction func mailButtonPressed(_ sender: Any) {
        if let mail = mailComposer {
            self .present(mail,
                          animated: true,
                          completion: nil)
        }
    }
}
