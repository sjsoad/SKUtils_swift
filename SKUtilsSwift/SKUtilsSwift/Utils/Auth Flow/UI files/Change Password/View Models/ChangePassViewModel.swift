//
//  ChangePassViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 09.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ChangePassViewModel: NSObject, ChangePasswordRequestProtocol, ValidationHelper {

    var requerstExecutingHandler: RequerstExecutingHandler?
    
    var requestSucceed: Dynamic<Bool> = Dynamic(false)
    
    var passValidator = EqualStringsValidator()
    var temporaryToken: String?
    
}
