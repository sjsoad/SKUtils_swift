//
//  LocationServicePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 25.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import CoreLocation

class LocationServicePermissions: NSObject, ServicePermissions {
 
    var alertConfiguration: SettingAlertConfiguration
    
    init(settingAlertConfiguration: SettingAlertConfiguration) {
        self.alertConfiguration = settingAlertConfiguration
    }
    
    func isServiceAvailable() -> PermissionsState {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            return .permissionsGranted
        case .notDetermined:
            return .permissionsNotAsked
        case .restricted, .denied:
            self.showSettingsAlert()
            return .permissionsDenied
        }
    }
}
