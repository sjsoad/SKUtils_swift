//
//  MicrophonePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import AVFoundation

class MicrophonePermissions: DefaultServicePermissions {
    
}

// MARK: - ServicePermissions -

extension MicrophonePermissions: ServicePermissions {
    
    typealias PermissionsState = AVAudioSessionRecordPermission
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission { [weak self] _ in
            guard let strongSelf = self else { return }
            handler(strongSelf.permissionsState())
        }
    }
    
    func permissionsState() -> PermissionsState {
        return AVAudioSession.sharedInstance().recordPermission()
    }

}

