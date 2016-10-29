//
//  MicrophonePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import AVFoundation

class MicrophonePermissions: NSObject, ServicePermissions, PermissionsRequest {

    var alertConfiguration: SettingAlertConfiguration
    
    init(settingAlertConfiguration: SettingAlertConfiguration) {
        self.alertConfiguration = settingAlertConfiguration
    }
    
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
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission { _ in
            handler(self.permissionsState())
        }
    }
    
}
