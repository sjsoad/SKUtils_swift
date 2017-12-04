//
//  LocationServicePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 25.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import CoreLocation

class LocationPermissions: DefaultServicePermissions {

    private var locationManager: CLLocationManager!
    private var requestPermissionsHandler: ((PermissionsState) -> Void)?

    override init(settingAlertTitles: AlertTitles) {
        super.init(settingAlertTitles: settingAlertTitles)
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
}

// MARK: - ServicePermissions -

extension LocationPermissions: ServicePermissions {
    
    typealias PermissionsState = CLAuthorizationStatus
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        requestPermissionsHandler = handler
        locationManager.requestAlwaysAuthorization()
    }
    
    func permissionsState() -> PermissionsState {
        return CLLocationManager.authorizationStatus()
    }
}

// MARK: - CLLocationManagerDelegate -

extension LocationPermissions: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // WARNING: - delegate method called for notDetermined state too -
        requestPermissionsHandler?(permissionsState())
    }

}

