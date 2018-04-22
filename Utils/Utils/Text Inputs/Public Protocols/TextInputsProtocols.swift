//
//  TextInputsProtocols.swift
//  TextInputs
//
//  Created by Sergey Kostyan on 22.04.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import PickerViewManager

public protocol DateSelectionHandlerSetting {
    func set(dateSelectionHandler handler: @escaping DatePickerFieldDateSelectionHandler)
}

public protocol DoneButtonHandlerSetting {
    associatedtype HandlerType
    func set(doneButtonHandler handler: HandlerType)
}

public protocol DoneTitleSetting {
    func set(doneTitle title: String)
}

public protocol PickerViewFieldReloading {
    func reload(with manager: PickerManager)
}
