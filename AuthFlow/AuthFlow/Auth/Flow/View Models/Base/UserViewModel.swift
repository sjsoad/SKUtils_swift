//
//  UserViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 21.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

class UserViewModel: NSObject {

    var profile: Profile!
    var authCredentials: AuthCredentials!
 
    init(userProfile: Profile,
         credentials: AuthCredentials) {
        profile = userProfile
        authCredentials = credentials
    }
    
    func logout() {
        if let grantType = GrantType(rawValue: profile.grantType!) {
            switch grantType {
            case .facebook:
                let facebook = FacebookAuth()
                facebook.logout()
                break
            case .instagram:
                let insta = InstagramAuth()
                insta.logout()
                break
            case .googlePlus:
                let google = GooglePlusAuth()
                google.logout()
                break
            default:
                print("no user")
            }
        }
    }

}
