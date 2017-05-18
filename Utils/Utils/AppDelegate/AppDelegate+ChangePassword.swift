//
//  AppDelegate+ChangePassword.swift
//  GeoTouch
//
//  Created by Sergey on 15.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

extension AppDelegate {

    func checkQueryString(url: String?) {
        if let token = QueryStringParser.parameter(fromURL: url,
                                                   name: "token") {
            presentChangePasswordDialog(token: token)
        }
    }
    
    func presentChangePasswordDialog(token: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
//            Here you can present window with ability to change password
//            AuthNavigation.presentPasswordChanger(temporaryToken: token,
//                                                  animated: true)
        }

    }

}
