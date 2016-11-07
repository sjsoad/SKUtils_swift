//
//  ExampleViewController.swift
//  SKUtilsSwift
//
//  Created by Mac on 02.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import MessageUI

class ExampleViewController: UIViewController, MailProtocol, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker: ImagePicker = {
        let alertTitles = AlertTitles(title: "Service",
                                      message: "Service is disabled! Please turn on it in Settings",
                                      actionButtonTitle: "Go to Settings",
                                      cancelButtonTitle: "Cancel")
        let cameraPermissions = CameraPermissions(settingAlertTitles: alertTitles)
        let libraryPermissions = PhotoLibraryPermissions(settingAlertTitles: alertTitles)
        let imagePicker = ImagePicker(configurationHandler: {picker in
            print(picker)
        },
                                      cameraPermissions: cameraPermissions,
                                      libraryPermissions: libraryPermissions)
        imagePicker.imagePickerController.delegate = imagePicker
        return imagePicker
    }()
    
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
    
    func applyImage(image: UIImage?) {
        self.imageView.image = image
    }
    
    @IBAction func imagePickerButtonPressed(_ sender: Any) {
        imagePicker.show(selectionHandler: { [weak self] (picker, mediaInfo) in
            let image = mediaInfo[UIImagePickerControllerOriginalImage] as? UIImage
            self?.applyImage(image: image)
        },
                         cancelHandler: nil,
                         completionHandler: nil)
    }
    
    @IBAction func mailButtonPressed(_ sender: Any) {
        self.showMailComposer(animated: true, configurationHandler: { (mailComposer) in
            mailComposer.setSubject("someSubject")
            mailComposer.mailComposeDelegate = self
        }, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        controller .dismiss(animated: true, completion: nil)
    }
}
