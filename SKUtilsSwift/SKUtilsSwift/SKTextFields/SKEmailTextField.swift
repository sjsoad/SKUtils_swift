//
//  SKEmailTextField.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 18.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class SKEmailTextField: SKBaseTextField {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.keyboardType = .EmailAddress
        self.textValidator = SKEmailValidator()
    }
    
}
