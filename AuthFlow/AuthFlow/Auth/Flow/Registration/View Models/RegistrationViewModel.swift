//
//  RegistrationViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 07.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class RegistrationViewModel: NSObject, RegistrationRequestProtocol, ValidationHelper {
    
    var requerstExecutingHandler: RequerstExecutingHandler?

    var requestSucceed: Dynamic<Bool> = Dynamic(false)
    
}
