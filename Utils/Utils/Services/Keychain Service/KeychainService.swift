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

class KeychainService: NSObject {

    // MARK: - Access Token -
    
    static func save(accessToken: String) {
        KeychainWrapper.standard.set(accessToken, forKey: userAccessToken)
    }
    
    static func loadAccessToken() -> String? {
        return KeychainWrapper.standard.string(forKey: userAccessToken)
    }
    
    static func deleteAccessToken() {
        KeychainWrapper.standard.removeObject(forKey: userAccessToken)
    }
    
    // MARK: - Password -
    
    static func save(password: String, for email: String) {
        KeychainWrapper.standard.set(password, forKey: email)
    }
    
    static func password(for email: String) -> String? {
        return KeychainWrapper.standard.string(forKey: email)
    }
    
    // MARK: - Autologin -
    
    static func save(loggedInUserId: Int) {
        KeychainWrapper.standard.set(loggedInUserId, forKey: loggedInUser)
    }
    
    static func loadLoggedInUserId() -> Int? {
        return KeychainWrapper.standard.integer(forKey: loggedInUser)
    }
    
    static func deleteLoggedInUserId() {
        KeychainWrapper.standard.removeObject(forKey: loggedInUser)
    }
}
