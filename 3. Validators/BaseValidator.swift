//
//  SKBaseValidator.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 14.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class BaseValidator: NSObject {

    @IBInspectable var maxTextLenght = 256
    @IBInspectable var minTextLenght = 1
    
    func isTextValid(_ text: String?) -> Bool {
        if let text = text {
            if minTextLenght > maxTextLenght {
                return text.characters.count >= minTextLenght
            }
            return text.characters.count >= minTextLenght && text.characters.count <= maxTextLenght
        }
        return false
    }

}
