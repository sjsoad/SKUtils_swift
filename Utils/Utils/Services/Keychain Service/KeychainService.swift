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

protocol AccessTokenManaging {
    func save(accessToken: String)
    func loadAccessToken() -> String?
    func deleteAccessToken()
}

protocol PasswordManaging {
    func save(password: String, for email: String)
    func password(for email: String) -> String?
}

protocol LoggedInUserManaging {
    func save(loggedInUserId: Int)
    func loadLoggedInUserId() -> Int?
    func deleteLoggedInUserId()
}

protocol KeychainService: AccessTokenManaging, PasswordManaging, LoggedInUserManaging {
    
}

class DefaultKeychainService: NSObject, KeychainService {
    
    private var keychain: KeychainWrapper
    
    override init() {
        self.keychain = KeychainWrapper.standard
    }
    
}

// MARK: - AccessTokenManaging -

extension DefaultKeychainService: AccessTokenManaging {
    
    func save(accessToken: String) {
        keychain.set(accessToken, forKey: userAccessToken)
    }
    
    func loadAccessToken() -> String? {
        return keychain.string(forKey: userAccessToken)
    }
    
    func deleteAccessToken() {
        keychain.removeObject(forKey: userAccessToken)
    }
    
    
}

// MARK: - PasswordManaging -

extension DefaultKeychainService: PasswordManaging {
    
    func save(password: String, for email: String) {
        keychain.set(password, forKey: email)
    }
    
    func password(for email: String) -> String? {
        return keychain.string(forKey: email)
    }
}

// MARK: - LoggedInUserManaging -

extension DefaultKeychainService: LoggedInUserManaging {
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

