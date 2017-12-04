//
//  PhotoLibraryPermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import Photos

class PhotoLibraryPermissions: DefaultServicePermissions {
    
}

// MARL: - ServicePermissions -

extension PhotoLibraryPermissions: ServicePermissions {
    
    typealias PermissionsState = PHAuthorizationStatus
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        PHPhotoLibrary.requestAuthorization { [weak self] _ in
            guard let strongSelf = self else { return }
            handler(strongSelf.permissionsState())
        }
    }
    
    func permissionsState() -> PermissionsState {
        return PHPhotoLibrary.authorizationStatus()
    }
    
}
