//
//  PermissionsRequesting.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

typealias PermissionsStateHandler = (PermissionsState) -> Void

protocol PermissionsRequesting {
    
    func requestPermissions(handler: @escaping PermissionsStateHandler)
}