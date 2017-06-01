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

    private(set) var alertTitles: AlertTitles
    
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
            CNContactStore().requestAccess(for: .contacts) { [weak self] _,_ in
                guard let strongSelf = self else { return }
                handler(strongSelf.permissionsState())
            }
        }
        else {
            ABAddressBookRequestAccessWithCompletion(nil) { [weak self] _,_ in
                guard let strongSelf = self else { return }
                handler(strongSelf.permissionsState())
            }
        }
    }
    
}
