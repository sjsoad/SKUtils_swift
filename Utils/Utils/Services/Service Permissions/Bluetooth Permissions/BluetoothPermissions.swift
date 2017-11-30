//
//  BluetoothServicePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import CoreBluetooth

class BluetoothPermissions: DefaultServicePermissions {

}

// MARK: - PermissionsStateble -

extension BluetoothPermissions: PermissionsStateble {
    
    func permissionsState() -> PermissionsState {
        switch CBPeripheralManager.authorizationStatus() {
        case .authorized:
            return .permissionsGranted
        case .notDetermined:
            return .permissionsNotAsked
        case .restricted, .denied:
            showSettingsAlert()
            return .permissionsDenied
        }
    }
}
