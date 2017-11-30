//
//  UserDefaultsService.swift
//  Place
//
//  Created by Sergey on 09.08.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import Foundation

// MARK: - UserDefaultsService -

protocol UserDefaultsService: UserDefaultsSetting, UserDefaultsGetting, UserDefaultsRemoving {
    
}

// MARK: - DefaultUserDefaultsService -

class DefaultUserDefaultsService: UserDefaultsService {
    
    private var defaults: UserDefaults =  UserDefaults.standard
    
}

// MARK: - UserDefaultsSetting -

protocol UserDefaultsSetting {
    func save(value: Any?, for key: String)
}

extension DefaultUserDefaultsService: UserDefaultsSetting {
    
    func save(value: Any?, for key: String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }

}

// MARK: - UserDefaultsGetting -

protocol UserDefaultsGetting {
    func value(for key: String) -> Any?
}

extension DefaultUserDefaultsService: UserDefaultsGetting {
    
    func value(for key: String) -> Any? {
        return defaults.value(forKey: key)
    }
    
}

// MARK: - UserDefaultsRemoving -

protocol UserDefaultsRemoving {
    func removeObject(for key: String)
}

extension DefaultUserDefaultsService: UserDefaultsRemoving {
    
    func removeObject(for key: String) {
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
    
}
