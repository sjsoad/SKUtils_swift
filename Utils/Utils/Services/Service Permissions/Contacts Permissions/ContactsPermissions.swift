//
//  ContactsServicePermissions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import Contacts
import AddressBook

class ContactsPermissions: DefaultServicePermissions {

}

// MARK: - ServicePermissions -

extension ContactsPermissions: ServicePermissions {
    
    typealias PermissionsState = CNAuthorizationStatus
    
    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        CNContactStore().requestAccess(for: .contacts) { [weak self] _, _ in
            guard let strongSelf = self else { return }
            handler(strongSelf.permissionsState())
        }
    }
    
    func permissionsState() -> PermissionsState {
        return CNContactStore.authorizationStatus(for: .contacts)
    }

}
