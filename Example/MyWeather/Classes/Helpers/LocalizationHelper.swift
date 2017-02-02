//
//  LocalizationHelper.swift
//  MyWeather
//
//  Created by Mac on 05.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class LocalizationHelper: NSObject {

    private static func availableLocalizations() -> [String] {
        return ["ar",
                "az",
                "be",
                "bs",
                "ca",
                "cs",
                "de",
                "el",
                "en",
                "es",
                "et",
                "fr",
                "hr",
                "hu",
                "id",
                "it",
                "is",
                "kw",
                "nb",
                "nl",
                "pl",
                "pt",
                "ru",
                "sk",
                "sl",
                "sr",
                "sv",
                "tet",
                "tr",
                "uk",
                "x-pig-latin",
                "zh",
                "zh-tw"]
    }
    
    static func localization() -> String {
        let availableLocalizations = LocalizationHelper.availableLocalizations()
        if let currentLocalization: String = SKUtils.localization() {
            if availableLocalizations.contains(currentLocalization) {
                return currentLocalization
            }
        }
        return "en"
    }
    
}
