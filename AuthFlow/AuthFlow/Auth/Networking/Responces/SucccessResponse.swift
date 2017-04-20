//
//  SucccessResponse.swift
//  GeoTouch
//
//  Created by Sergey on 15.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class SucccessResponse: ResponseProtocol {

    var success: Bool = false
    
    required init(JSON: AnyObject) {
        if let s = JSON["success"] as? Bool {
            success = s
        }
    }
    
}
