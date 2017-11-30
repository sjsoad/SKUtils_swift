//
//  LocationServicePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 25.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import CoreLocation

class LocationPermissions: DefaultServicePermissions, ServicePermissions {

    private var locationManager: CLLocationManager!
    private var requestPermissionsHandler: PermissionsStateHandler?
    
    override init(settingAlertTitles: AlertTitles) {
        super.init(settingAlertTitles: settingAlertTitles)
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
}

// MARK: - PermissionsStateble -

extension LocationPermissions: PermissionsStateble {
    
    func permissionsState() -> PermissionsState {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            return .permissionsGranted
        case .notDetermined:
            return .permissionsNotAsked
        case .restricted, .denied:
            showSettingsAlert()
            return .permissionsDenied
        }
    }
}

// MARK: - PermissionsRequesting -

extension LocationPermissions: PermissionsRequesting {
    
    func requestPermissions(handler: @escaping PermissionsStateHandler) {
        requestPermissionsHandler = handler
        locationManager.requestAlwaysAuthorization()
    }
    
}

// MARK: - CLLocationManagerDelegate -

extension LocationPermissions: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        requestPermissionsHandler?(permissionsState())
    }
    
}
