//
//  SocialNetworksHelper.swift
//  Place
//
//  Created by Sergey on 16.08.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import UIKit

class SocialNetworksHelper: NSObject {

    private static let facebookProfileAppLink: String = "fb://profile/%@"
    private static let twitterProfileAppLink: String = "twitter://user?screen_name=%@"
    private static let instagramProfileAppLink: String = "instagram://user?username=%@"
    private static let facebookProfileWebLink: String = "https://www.facebook.com/%@"
    private static let twitterProfileWebLink: String = "https://twitter.com/%@"
    private static let instagramProfileWebLink: String = "https://www.instagram.com/%@/"
    
    static func open(facebookProfile name: String?) {
        guard var name = name else { return }
        name = name.components(separatedBy: " ").joined()
        let urlString = String(format: facebookProfileAppLink, name)
        if !open(urlString) {
            let urlString = String(format: facebookProfileWebLink, name)
            _ = open(urlString)
        }
    }
    
    static func open(twitterProfile name: String?) {
        guard let name = name else { return }
        let urlString = String(format: twitterProfileAppLink, name)
        if !open(urlString) {
            let urlString = String(format: twitterProfileWebLink, name)
            _ = open(urlString)
        }
    }
    
    static func open(instagramProfile name: String?) {
        guard let name = name else { return }
        let urlString = String(format: instagramProfileAppLink, name)
        if !open(urlString) {
            let urlString = String(format: instagramProfileWebLink, name)
            _ = open(urlString)
        }
    }
    
    private static func open(_ urlString: String?) -> Bool {
        guard let urlString = urlString,
            let URL = URL(string: urlString),
            UIApplication.shared.canOpenURL(URL) else { return false}
        UIApplication.shared.open(URL, options: [:], completionHandler: nil)
        return true
    }
    
}
