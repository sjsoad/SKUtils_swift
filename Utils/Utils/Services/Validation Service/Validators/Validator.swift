//
//  Validator.swift
//  SwiftUtils
//
//  Created by Sergey on 01.12.2017.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol Validator {
    func isValid(_ text: String?) -> Bool
}

class DefaultValidator: NSObject {

    var minTextLenght: Int
    var maxTextLenght: Int
    var regularExpresionString: String?
    var predicateString: String?
    
    init(minTextLenght: Int = 1, maxTextLenght: Int = 256, regularExpresionString: String? = nil, predicateString: String? = nil) {
        self.minTextLenght = minTextLenght
        self.maxTextLenght = maxTextLenght
        self.regularExpresionString = regularExpresionString
        self.predicateString = predicateString
    }
    
}

// MARK: - Validator -

extension DefaultValidator: Validator {
    
    func isValid(_ text: String?) -> Bool {
        return isValidByLength(of: text) && isValidByRegularExpression(text: text)
    }
    
    // MARK: - Private -
    
    private func isValidByLength(of text: String?) -> Bool {
        guard let text = text else { return false }
        if minTextLenght > maxTextLenght {
            return text.count >= minTextLenght
        }
        return text.count >= minTextLenght && text.count <= maxTextLenght
    }
    
    private func isValidByRegularExpression(text: String?) -> Bool {
        guard let predicateString = predicateString, let regularExpresionString = regularExpresionString else {
            return true
        }
        let validationPredicate = NSPredicate(format: predicateString, regularExpresionString)
        return validationPredicate.evaluate(with: text)
    }
    
}
