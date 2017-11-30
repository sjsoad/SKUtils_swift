//
//  MicrophonePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import AVFoundation

class MicrophonePermissions: DefaultServicePermissions, ServicePermissions {
    
}

// MARK: - PermissionsStateble -

extension MicrophonePermissions: PermissionsStateble {
    
    func permissionsState() -> PermissionsState {
        switch AVAudioSession.sharedInstance().recordPermission() {
        case .granted:
            return .permissionsGranted
        case .denied:
            showSettingsAlert()
            return .permissionsDenied
        case .undetermined:
            return .permissionsNotAsked
        }
    }
}

// MARK: - PermissionsRequesting -

extension MicrophonePermissions: PermissionsRequesting {
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission { [weak self] _ in
            guard let strongSelf = self else { return }
            handler(strongSelf.permissionsState())
        }
    }
    
}
