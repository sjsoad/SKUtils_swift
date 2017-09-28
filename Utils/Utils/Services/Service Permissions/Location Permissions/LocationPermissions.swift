//
//  LocationServicePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 25.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import CoreLocation

class LocationPermissions: NSObject, ServicePermissions {
 
    private(set) var alertTitles: AlertTitles
    
    required init(settingAlertTitles: AlertTitles) {
        self.alertTitles = settingAlertTitles
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
