//
//  ServicesRepository.swift
//  SwiftUtils
//
//  Created by Sergey on 01.12.2017.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ServicesRepository {
    
    private var registry = [String: Any]()
    
    init() {}
    
    func registerService<T>(service: T) {
        let key = "\(T.self)"
        registry[key] = service
    }
    
    func getService<T>() -> T? {
        let key = "\(T.self)"
        if registry[key] == nil {
            print("ServicesRepository: Nil value for \(key)")
        }
        return registry[key] as? T
    }
    
}


