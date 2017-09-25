//
//  UserDefaultsService.swift
//  Place
//
//  Created by Sergey on 09.08.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import Foundation

class UserDefaultsService {

    static func save(value: Any?, for key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }

    static func value(for key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    
}
