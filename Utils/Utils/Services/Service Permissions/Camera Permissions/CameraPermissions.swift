//
//  CameraServicePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import AVFoundation

class CameraPermissions: DefaultServicePermissions {
    
}

// MARK: - ServicePermissions -

extension CameraPermissions: ServicePermissions {
    
    typealias PermissionsState = AVAuthorizationStatus
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        AVCaptureDevice.requestAccess(for: .video) { [weak self] _ in
            guard let strongSelf = self else { return }
            handler(strongSelf.permissionsState())
        }
    }
    
    func permissionsState() -> PermissionsState {
        return AVCaptureDevice.authorizationStatus(for: .video)
    }
    
}
