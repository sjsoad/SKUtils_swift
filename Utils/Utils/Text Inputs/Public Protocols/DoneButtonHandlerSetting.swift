//
//  DoneButtonHandlerSetting.swift
//  SwiftUtils
//
//  Created by Sergey on 28.11.2017.
//Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol DoneButtonHandlerSetting {
    associatedtype HandlerType
    func set(doneButtonHandler handler: HandlerType)
}
