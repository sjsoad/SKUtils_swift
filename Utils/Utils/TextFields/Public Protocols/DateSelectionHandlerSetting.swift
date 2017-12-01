//
//  DateSelectionHandlerSetting.swift
//  SwiftUtils
//
//  Created by Sergey on 28.11.2017.
//Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol DateSelectionHandlerSetting {
    func set(dateSelectionHandler handler: @escaping DatePickerFieldDateSelectionHandler)
}
