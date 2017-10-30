//
//  CameraServicePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import AVFoundation

class CameraPermissions: NSObject, ServicePermissions {

    private(set) var alertTitles: AlertTitles
    
    required init(settingAlertTitles: AlertTitles) {
        self.alertTitles = settingAlertTitles
    }
    
}

// MARK: - PermissionsStateble -
extension CameraPermissions: PermissionsStateble {
    
    func permissionsState() -> PermissionsState {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return .permissionsGranted
        case .notDetermined:
            return .permissionsNotAsked
        case .restricted, .denied:
            self.showSettingsAlert()
            return .permissionsDenied
        }
    }
    
}

// MARK: - PermissionsRequesting -
extension CameraPermissions: PermissionsRequesting {
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        AVCaptureDevice.requestAccess(for: .video) { [weak self] _ in
            guard let strongSelf = self else { return }
            handler(strongSelf.permissionsState())
        }
    }
}
