//
//  SKEmailValidator.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 14.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class EmailValidator: DefaultValidator {
    
    private static let defaultRegularExpresionString: String = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
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
