//
//  DynamicLocalization.swift
//  ShadeCharts
//
//  Created by Evgeniy Leychenko on 17.03.17.
//  Copyright © 2017 theappsolutions.com. All rights reserved.
//

import Foundation

enum SupportedLanguage: String {
    case english = "en"
    case italian = "it"
    case swedish = "sv"
    case finnish = "fi"
    case norwegian = "nb-NO"
    case danish = "da"
    case portuguese = "pt-PT"
    case spanish = "es"
    case greek = "el"
    case french = "fr"
    
    static func all() -> [SupportedLanguage] {
        return [.english, .italian, .swedish, .finnish, .norwegian, .danish, .portuguese, .spanish, .greek, .french]
    }
    
    func stringRepresentation() -> String {
        switch self {
        case .english:
            return Localization.Languages.english
        case .italian:
            return Localization.Languages.italian
        case .swedish:
            return Localization.Languages.swedish
        case .finnish:
            return Localization.Languages.finnish
        case .norwegian:
            return Localization.Languages.norwegian
        case .danish:
            return Localization.Languages.danish
        case .portuguese:
            return Localization.Languages.portuguese
        case .spanish:
            return Localization.Languages.spanish
        case .greek:
            return Localization.Languages.greek
        case .french:
            return Localization.Languages.french
        }
    }
    
    func serverCode() -> String {
        switch self {
        case .english:
            return "en"
        case .italian:
            return "it"
        case .swedish:
            return "sv"
        case .finnish:
            return "fi"
        case .norwegian:
            return "no"
        case .danish:
            return "da"
        case .portuguese:
            return "pt"
        case .spanish:
            return "es"
        case .greek:
            return "el"
        case .french:
            return "fr"
        }
    }
    
    func helpCenterCode() -> String {
        switch self {
        case .english:
            return "en-us"
        case .italian:
            return "it"
        case .swedish:
            return "sv"
        case .finnish:
            return "fi"
        case .norwegian:
            return "no"
        case .danish:
            return "da"
        case .portuguese:
            return "pt"
        case .spanish:
            return "es"
        case .greek:
            return "el"
        case .french:
            return "fr"
        }
    }
}

class DynamicLocalization {
    
    static let shared = DynamicLocalization()
    
    // MARK: - Lifecycle -
    
    init() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleLanguageChange),
                                               name: NSNotification.Name(rawValue: GGLOCALIZATIONSYSTEM_LANGUAGE_DID_CHANGE),
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Public -
    
    func set(language: SupportedLanguage) {
        GGLocalizationSystem.sharedLocal().setLanguage(language.rawValue)
    }
    
    func resetLanguage() {
        GGLocalizationSystem.sharedLocal().resetLocalization()
    }
    
    func currentLanguage() -> SupportedLanguage {
        return SupportedLanguage(rawValue: GGLocalizationSystem.sharedLocal().getLanguage()) ?? .english
    }
    
    // MARK: - Private -
    
    @objc private func handleLanguageChange() {
        NotificationCenter.default.post(name: Notification.Name.App.LanguageDidChange, object: nil)
    }
}

extension Notification.Name {
    
    enum App {
        static let LanguageDidChange = Notification.Name(rawValue: "language_did_change")
    }
}
