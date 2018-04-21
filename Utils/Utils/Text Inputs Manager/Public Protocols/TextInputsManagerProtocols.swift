//
//  TextInputsManagerProtocols.swift
//  SwiftUtils
//
//  Created by Sergey on 12.10.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation
import UIKit

protocol TextFieldsManagerReloading {
    func reloadTextFieldsManager()
}

protocol TextInputsClearing {
    func clearTextInputs()
}

protocol KeyboardHiding {
    func hideKeyboard()
}

protocol FirstResponding {
    func firstResponder() -> UIView?
}
