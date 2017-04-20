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

class ContactsPermissions: NSObject, ServicePermissions, RequestPermissions {

    var alertTitles: AlertTitles
    
    init(settingAlertTitles: AlertTitles) {
        self.alertTitles = settingAlertTitles
    }
    
    func permissionsState() -> PermissionsState {
        
        if #available(iOS 9.0, *) {
            switch CNContactStore.authorizationStatus(for: .contacts) {
            case .authorized:
                return .permissionsGranted
            case .notDetermined:
                return .permissionsNotAsked
            case .restricted, .denied:
                self.showSettingsAlert()
                return .permissionsDenied
            }
        }
        switch ABAddressBookGetAuthorizationStatus() {
        case .authorized:
            return .permissionsGranted
        case .notDetermined:
            return .permissionsNotAsked
        case .restricted, .denied:
            self.showSettingsAlert()
            return .permissionsDenied
        }
    }

    func requestPermissions(handler: @escaping (PermissionsState) -> Void) {
        if #available(iOS 9.0, *) {
            CNContactStore().requestAccess(for: .contacts) { _,_ in
                handler(self.permissionsState())
            }
        }
        else {
            ABAddressBookRequestAccessWithCompletion(nil) { _,_ in
               handler(self.permissionsState()) 
            }
        }
    }
    
}
