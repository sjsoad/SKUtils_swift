//
//  ViewController.swift
//  SwiftUtils
//
//  Created by Sergey on 14.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var photoLibraryPermissions: PhotoLibraryPermissions = {
        let alertTitles = AlertTitles(title: "Photo Library Permissions", message: "!", actionButtonTitle: "Go Settings", cancelButtonTitle: "Cancel")
        let bluetoothPermissions = PhotoLibraryPermissions(settingAlertTitles: alertTitles)
        return bluetoothPermissions
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        DispatchQueue.global(qos: .background).async { [weak self] in
//            /*self?.*/photoLibraryPermissions.requestPermissions { [weak self] (state) in
//                if state == .denied {
                    /*self?.*/photoLibraryPermissions.showSettingsAlert()
//                }
//            }
//        }
       
    }
    
}
