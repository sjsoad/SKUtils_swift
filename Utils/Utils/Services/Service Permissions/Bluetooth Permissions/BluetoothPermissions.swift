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

    private var bluetoothManager: CBPeripheralManager?
    private var requestPermissionsHandler: ((PermissionsState) -> Void)?
    
}

// MARK: - ServicePermissions -

extension BluetoothPermissions: ServicePermissions {
    
    typealias PermissionsState = (authStatus: CBPeripheralManagerAuthorizationStatus, state: CBManagerState)
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        requestPermissionsHandler = handler
        bluetoothManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    func permissionsState() -> PermissionsState {
        return (CBPeripheralManager.authorizationStatus(), bluetoothManager?.state ?? .poweredOff)
    }
    
}

// MARK: - CBCentralManagerDelegate -

extension BluetoothPermissions: CBPeripheralManagerDelegate {
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        requestPermissionsHandler?(permissionsState())
    }
    
}
