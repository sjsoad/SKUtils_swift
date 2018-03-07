//
//  ServicePermissionsFactory.swift
//  Yada
//
//  Created by Sergey on 07.03.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

class ServicePermissionsFactory {

    class func cameraPermissions() -> CameraPermissions {
        let titles = AlertTitles(title: <#Localizations.Alerts.cameraPermissionTitle#>,
                                 message: <#Localizations.Alerts.cameraPermissionMessage#>,
                                 actionButtonTitle: <#Localizations.Buttons.goToSettings#>,
                                 cancelButtonTitle: <#Localizations.Buttons.ok#>)
        return CameraPermissions(settingAlertTitles: titles)
    }
    
    class func photoLibraryPermissions() -> PhotoLibraryPermissions {
        let titles = AlertTitles(title: <#Localizations.Alerts.photoLibraryPermissionTitle#>,
                                 message: <#Localizations.Alerts.photoLibraryPermissionMessage#>,
                                 actionButtonTitle: <#Localizations.Buttons.goToSettings#>,
                                 cancelButtonTitle: <#Localizations.Buttons.ok#>)
        return PhotoLibraryPermissions(settingAlertTitles: titles)
    }
    
}
