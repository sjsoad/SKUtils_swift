//
//  PermissionsService.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 25.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

struct SettingAlertConfiguration {
    var title : String
    var message : String
    var settingsButtonTitle : String
    var cancelButtonTitle : String
}

protocol ServicePermissions {
    
    var alertConfiguration: SettingAlertConfiguration { get }
    func isServiceAvailable() -> Bool
    
}
