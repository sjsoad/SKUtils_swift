//
//  SKBaseValidator.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 14.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class BaseValidator: NSObject {

    var maxTextLenght = 256
    var minTextLenght = 1
    
    func isValid(_ text: String?) -> Bool {
        guard let text = text else { return false }
        if minTextLenght > maxTextLenght {
            return text.count >= minTextLenght
        }
        return text.count >= minTextLenght && text.count <= maxTextLenght
    }

}
