//
//  PermissionsRequest.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

public typealias handler = (PermissionsState) -> Void

protocol PermissionsRequest {
    
    func requestPermissions(handler: @escaping handler)
}
