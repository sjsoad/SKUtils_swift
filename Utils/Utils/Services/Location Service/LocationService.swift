//
//  SKLocationService.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 03.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

// TODO: READ ME

/* -------------------------------------------------------------------------------------------------------------------------
 iOS 10:
 Add description to NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription in order to use location Service
 Add this property to your class and init it with valid arguments, add delegate and enjoy.

var locationService: LocationService = {
    let alertTitles = AlertTitles(title: "Location Service",
                                  message: "Location service is disabled! Please turn on it in Settings",
                                  actionButtonTitle: "Go to Settings",
                                  cancelButtonTitle: "Cancel")
    let locationPermissions = LocationPermissions(settingAlertTitles: alertTitles)
    let locationSerice = LocationService(withLocationUsage: .requestAlwaysAuthorization,
                                         locationPermissions: locationPermissions)
    return locationSerice
}()
 iOS 11: Privacy - Location Always and When In Use Usage Description - new key
/---------------------------------------------------------------------------------------------------------------------------- */

import UIKit
import CoreLocation

enum LocationUsage: String {
    case requestWhenInUseAuthorization
    case requestAlwaysAuthorization
}

class LocationService: CLLocationManager {
    
    private var locationUsage: LocationUsage
    private var locationPermissions: LocationPermissions
    
    init(withLocationUsage locationUsage: LocationUsage,
         locationPermissions: LocationPermissions) {
        self.locationUsage = locationUsage
        self.locationPermissions = locationPermissions
        super.init()
        self.checkPermissions()
    }
    
    // MARK: - Public methods
    
    @discardableResult
    func checkPermissions() -> PermissionsState {
        let permissionsState = locationPermissions.permissionsState()
        switch permissionsState {
        case .permissionsNotAsked:
            askPermissions()
            break
        default:
            break
        }
        return permissionsState
    }
    
    // MARK: - Private -
    
    fileprivate func askPermissions() {
        if responds(to: NSSelectorFromString(locationUsage.rawValue)) {
            perform(NSSelectorFromString(locationUsage.rawValue))
        }
    }
}
