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
        let appLink = String(format: facebookProfileAppLink, name)
        let webLink = String(format: facebookProfileWebLink, name)
        open(appLink: appLink, alternative: webLink)
    }
    
    static func open(twitterProfile name: String?) {
        guard let name = name else { return }
        let appLink = String(format: twitterProfileAppLink, name)
        let webLink = String(format: twitterProfileWebLink, name)
        open(appLink: appLink, alternative: webLink)
    }
    
    static func open(instagramProfile name: String?) {
        guard let name = name else { return }
        let appLink = String(format: instagramProfileAppLink, name)
        let webLink = String(format: instagramProfileWebLink, name)
        open(appLink: appLink, alternative: webLink)
    }
    
    // MARK: - Private -
    
    private static func open(appLink: String?, alternative webLink: String?) {
        if let appLink = appLink, let appUrl = URL(string: appLink), canOpen(appUrl) {
            open(appUrl)
        } else  if let webLink = webLink, let webUrl = URL(string: webLink), canOpen(webUrl) {
            open(webUrl)
        }
    }
    
    private static func canOpen(_ url: URL) -> Bool {
        return UIApplication.shared.canOpenURL(url)
    }
    
    private static func open(_ url: URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
}
