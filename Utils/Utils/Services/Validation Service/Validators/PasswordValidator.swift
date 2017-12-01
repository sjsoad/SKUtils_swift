//
//  SKPasswordValidator.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 17.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class PasswordValidator: DefaultValidator {

    private static let defaultRegularExpresionString: String = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$"
    private static let defaultPredicateString: String = "SELF MATCHES %@"
    
    override init(minTextLenght: Int = 1,
                  maxTextLenght: Int = 256,
                  regularExpresionString: String? = defaultRegularExpresionString,
                  predicateString: String? = defaultPredicateString) {
        super.init(minTextLenght: minTextLenght,
                   maxTextLenght: maxTextLenght,
                   regularExpresionString: regularExpresionString,
                   predicateString: predicateString)
    }
    
}
