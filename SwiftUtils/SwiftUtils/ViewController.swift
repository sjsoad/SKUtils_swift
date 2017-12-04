//
//  ViewController.swift
//  SwiftUtils
//
//  Created by Sergey on 14.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var bluetoothPermissions: BluetoothPermissions = {
        let alertTitles = AlertTitles(title: "bluetooth", message: "!", actionButtonTitle: "Go Settings", cancelButtonTitle: "Cancel")
        let bluetoothPermissions = BluetoothPermissions(settingAlertTitles: alertTitles)
        return bluetoothPermissions
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bluetoothPermissions.requestPermissions { (state) in
            print(state.authStatus.rawValue)
            print(state.state.rawValue)
        }
    }
    
}
