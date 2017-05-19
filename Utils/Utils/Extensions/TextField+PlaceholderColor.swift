//
//  TextField+PlaceholderColor.swift
//  StudentShare
//
//  Created by Sergey on 24.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

extension UITextField {

    @IBInspectable var placeholderColor: UIColor? {
        get {
            return self.placeholderColor
        }
        set {
            let text = self.placeholder != nil ? self.placeholder! : ""
            self.attributedPlaceholder = NSAttributedString(string: text,
                                                            attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
    
}

