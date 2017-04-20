//
//  PermissionsRequest.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

public typealias Handler = (PermissionsState) -> Void

protocol RequestPermissions {
    
    func requestPermissions(handler: @escaping Handler)
}
