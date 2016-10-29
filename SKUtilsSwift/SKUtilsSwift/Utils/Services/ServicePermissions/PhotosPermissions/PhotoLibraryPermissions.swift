//
//  PhotoLibraryPermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import Photos

class PhotoLibraryPermissions: NSObject, ServicePermissions, PermissionsRequest {

    var alertConfiguration: SettingAlertConfiguration
    
    init(settingAlertConfiguration: SettingAlertConfiguration) {
        self.alertConfiguration = settingAlertConfiguration
    }
    
    func permissionsState() -> PermissionsState {
    
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            return .permissionsGranted
        case .notDetermined:
            return .permissionsNotAsked
        case .restricted, .denied:
            self.showSettingsAlert()
            return .permissionsDenied
        }
    }
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        PHPhotoLibrary.requestAuthorization { _ in
            handler(self.permissionsState())
        }
    }
    
}
