//
//  MicrophonePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import AVFoundation

class MicrophonePermissions: NSObject, ServicePermissions {

    private(set) var alertTitles: AlertTitles
    
    required init(settingAlertTitles: AlertTitles) {
        self.alertTitles = settingAlertTitles
    }
    
}

// MARK: - PermissionsStateble -
extension MicrophonePermissions: PermissionsStateble {
    
    func permissionsState() -> PermissionsState {
        switch AVAudioSession.sharedInstance().recordPermission() {
        case AVAudioSessionRecordPermission.granted:
            return .permissionsGranted
        case AVAudioSessionRecordPermission.denied:
            self.showSettingsAlert()
            return .permissionsDenied
        default:
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
