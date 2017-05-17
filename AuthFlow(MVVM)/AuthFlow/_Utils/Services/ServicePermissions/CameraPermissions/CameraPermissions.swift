//
//  CameraServicePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import AVFoundation

class CameraPermissions: NSObject, ServicePermissions, RequestPermissions {

    var alertTitles: AlertTitles
    
    init(settingAlertTitles: AlertTitles) {
        self.alertTitles = settingAlertTitles
    }
    
    func permissionsState() -> PermissionsState {
        
        switch AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) {
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
        AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { _ in
            handler(self.permissionsState())
        }
    }
}
