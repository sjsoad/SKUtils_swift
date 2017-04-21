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
            case .authTypeFacebook:
                let facebook = FacebookAuth()
                facebook.logout()
                break
            case .authTypeInstagram:
                let insta = InstagramAuth()
                insta.logout()
                break
            case .authTypeGooglePlus:
                let google = GooglePlusAuth()
                google.logout()
                break
            default:
                print("no user")
            }
        }
    }

}
