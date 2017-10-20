//
//  User.swift
//  New Data Source
//
//  Created by Sergey on 19.10.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class User: NSObject {

    var firstName: String = ""
    var lastName: String = ""
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
}
