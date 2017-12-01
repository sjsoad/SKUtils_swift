//
//  UserDefaultsService.swift
//  Place
//
//  Created by Sergey on 09.08.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import Foundation

// MARK: - UserDefaultsService -

protocol UserDefaultsService {
    
    func save(value: Any?, for key: String)
    func value(for key: String) -> Any?
    func removeObject(for key: String)
}

// MARK: - DefaultUserDefaultsService -

class DefaultUserDefaultsService {
    
    private var defaults: UserDefaults =  UserDefaults.standard
    
}

extension DefaultUserDefaultsService: UserDefaultsService {
    
    func save(value: Any?, for key: String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }

    func value(for key: String) -> Any? {
        return defaults.value(forKey: key)
    }
    
    func removeObject(for key: String) {
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
    
}
