//
//  IpResponse.swift
//  SwiftUtils
//
//  Created by Sergey on 25.07.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

class IpResponse: APIResponsing {
    
    var result: IpResponseValue?
    
    required init(JSON: AnyObject) {
        result = JSON as? IpResponseValue
    }
}
