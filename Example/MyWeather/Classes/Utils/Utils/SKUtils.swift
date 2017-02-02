//
//  SKUtils.swift
//  SKUtilsSwift
//
//  Created by Mac on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation

class SKUtils: NSObject {

    static func documentsDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }

    static func cachesDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    }
    
    static func localization(availableLocalizations: [String]? = nil) -> String? {
        let languages = NSLocale.preferredLanguages
        for language in languages {
            let languageDictionary = NSLocale.components(fromLocaleIdentifier: language)
            if let localization = languageDictionary["kCFLocaleLanguageCodeKey"] {
                return localization
            }
        }
        return nil
    }
    
    static func delegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}
