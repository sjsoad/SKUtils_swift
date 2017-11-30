//
//  PhotoLibraryPermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import Photos

class PhotoLibraryPermissions: DefaultServicePermissions, ServicePermissions {
    
}

// MARL: - PermissionStateble -

extension PhotoLibraryPermissions: PermissionsStateble {
    
    func permissionsState() -> PermissionsState {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
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

extension PhotoLibraryPermissions: PermissionsRequesting {
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        PHPhotoLibrary.requestAuthorization { [weak self] _ in
            guard let strongSelf = self else { return }
            handler(strongSelf.permissionsState())
        }
    }
    
}
