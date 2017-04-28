//
//  ProfileViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ProfileViewModel: NSObject, ProfileRequestProtocol {

    var requerstExecutingHandler: RequerstExecutingHandler?
    
    var requestSucceed: Dynamic<Bool> = Dynamic(false)
    var profile: Profile?
    
}
