//
//  ProfileRepsonse.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import AERecord
import Groot

class ProfileRepsonse: ResponseProtocol, Profilable {

    var profile: Profile?
    
    required init(JSON: AnyObject) {
        if let identifier = JSON["id"] as? Int64 {
            let nickname = JSON["nickName"] as? String
            let email = JSON["email"] as? String
            let grantType = JSON["grantType"] as? String
            profile = CoreDataFactory.createProfile(identifier: identifier,
                                                    nickname: nickname,
                                                    email: email,
                                                    grantType: grantType)
        }
    }
    
}
