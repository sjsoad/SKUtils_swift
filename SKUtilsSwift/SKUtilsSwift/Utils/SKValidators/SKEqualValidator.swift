//
//  SKEqualValidator.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 03.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class SKEqualValidator: NSObject {

    func isTextEqual(firstString: String?, secondString: String?) -> Bool {
        if firstString == nil || secondString == nil {
            return false
        }
        else {
            return firstString == secondString
        }
    }
    
}
