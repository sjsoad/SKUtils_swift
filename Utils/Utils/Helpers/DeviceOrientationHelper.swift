//
//  DeviceOrientationHelper.swift
//  Illumina Color
//
//  Created by Sergey on 25.01.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

class DeviceOrientationHelper {
    
    // indicate current device is in the LandScape orientation
    static var isLandscape: Bool {
        return UIDevice.current.orientation.isValidInterfaceOrientation
            ? UIDevice.current.orientation.isLandscape
            : UIApplication.shared.statusBarOrientation.isLandscape
    }
    
    // indicate current device is in the Portrait orientation
    static var isPortrait: Bool {
        return UIDevice.current.orientation.isValidInterfaceOrientation
            ? UIDevice.current.orientation.isPortrait
            : UIApplication.shared.statusBarOrientation.isPortrait
    }
    
}
