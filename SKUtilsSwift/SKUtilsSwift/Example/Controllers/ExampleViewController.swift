//
//  ExampleViewController.swift
//  SKUtilsSwift
//
//  Created by Mac on 02.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import MessageUI

class ExampleViewController: UIViewController, MailComposer, MFMailComposeViewControllerDelegate, ImagePicker {

    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker = UIImagePickerController().configure(configurator: { (picker) in
        picker.sourceType = .camera
    })
    var cameraPermissions: CameraPermissions?/* = {
        let alertTitles = AlertTitles(title: "Service",
                                      message: "Service is disabled! Please turn on it in Settings",
                                      actionButtonTitle: "Go to Settings",
                                      cancelButtonTitle: "Cancel")
        let cameraPermissions = CameraPermissions(settingAlertTitles: alertTitles)
        return cameraPermissions
    }()*/
    var libraryPermissions: PhotoLibraryPermissions?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func applyImage(image: UIImage?) {
        self.imageView.image = image
    }
    
    @IBAction func imagePickerButtonPressed(_ sender: Any) {
        self.showPicker(completionHandler: nil)
    }
    
    @IBAction func mailButtonPressed(_ sender: Any) {
        self.showMailComposer(animated: true, configurationHandler: { (mailComposer) in
            mailComposer.setSubject("someSubject")
            mailComposer.mailComposeDelegate = self
        }, completion: nil)
    }
    
    //MARK: - MFMailComposeViewControllerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        controller .dismiss(animated: true, completion: nil)
    }
}
