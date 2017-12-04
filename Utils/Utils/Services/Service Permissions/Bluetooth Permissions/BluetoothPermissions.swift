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

    private var bluetoothManager: CBCentralManager?
    private var requestPermissionsHandler: ((PermissionsState) -> Void)?
    
}

// MARK: - ServicePermissions -

extension BluetoothPermissions: ServicePermissions {
    
    typealias PermissionsState = CBPeripheralManagerAuthorizationStatus
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        requestPermissionsHandler = handler
        let opts = [CBCentralManagerOptionShowPowerAlertKey: false]
        bluetoothManager = CBCentralManager(delegate: self, queue: nil, options: opts)
    }
    
    func permissionsState() -> PermissionsState {
        return CBPeripheralManager.authorizationStatus()
    }
    
}

// MARK: - CBCentralManagerDelegate -

extension BluetoothPermissions: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        requestPermissionsHandler?(permissionsState())
    }
    
}
