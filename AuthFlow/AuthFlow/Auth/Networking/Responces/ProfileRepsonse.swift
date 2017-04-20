//
//  ProfileRepsonse.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ProfileRepsonse: ResponseProtocol, Profilable {

    var profile: Profile?
    
    required init(JSON: AnyObject) {
        // process responce
    }
    
}
