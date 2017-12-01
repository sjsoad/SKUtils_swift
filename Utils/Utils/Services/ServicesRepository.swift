//
//  ServicesRepository.swift
//  SwiftUtils
//
//  Created by Sergey on 01.12.2017.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ServicesRepository {

    class var localDataStorage: LocalDataStorage {
        return DefaultLocalDataStorage()
    }
    
    class var apiClientService: APIClientService {
        return APIClient()
    }
   
    class var userDefaultsService: UserDefaultsService {
        return DefaultUserDefaultsService()
    }
    
    class var timerService: TimerService {
        return DefaultTimerService()
    }
    
    class var keychainService: KeychainService {
        return DefaultKeychainService()
    }
    
    class var validationService: ValidationService {
        return DefaultValidationService()
    }
}


