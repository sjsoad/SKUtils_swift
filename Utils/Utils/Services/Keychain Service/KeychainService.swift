//
//  KeychainService.swift
//  Nioxin
//
//  Created by Sergey on 12.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

private let userAccessToken = "AccessToken"
private let loggedInUser = "LoggedInUser"

class DefaultKeychainService: NSObject {
    
    private var keychain: KeychainWrapper
    
    override init() {
        self.keychain = KeychainWrapper.standard
    }
    
    func save(accessToken: String) {
        keychain.set(accessToken, forKey: userAccessToken)
    }
    
    func loadAccessToken() -> String? {
        return keychain.string(forKey: userAccessToken)
    }
    
    func deleteAccessToken() {
        keychain.removeObject(forKey: userAccessToken)
    }
    
    func save(password: String, for email: String) {
        keychain.set(password, forKey: email)
    }
    
    func password(for email: String) -> String? {
        return keychain.string(forKey: email)
    }

    func save(loggedInUserId: Int) {
        keychain.set(loggedInUserId, forKey: loggedInUser)
    }
    
    func loadLoggedInUserId() -> Int? {
        return keychain.integer(forKey: loggedInUser)
    }
    
    func deleteLoggedInUserId() {
        keychain.removeObject(forKey: loggedInUser)
    }
    
}

