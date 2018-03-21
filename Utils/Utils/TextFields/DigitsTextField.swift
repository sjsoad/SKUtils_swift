//
//  DigitsTextField.swift
//  Yada
//
//  Created by Sergey on 21.03.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

class DigitsTextField: ToolbarTextField {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        keyboardType = .numberPad
    }
    
}
