//
//  SKUtils.swift
//  SKUtilsSwift
//
//  Created by Mac on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation

class SKUtils: NSObject {

    class func documentsDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }

    class func cachesDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    }
    
}
