//
//  WindowProtocol.swift
//  SwiftUtils
//
//  Created by Sergey on 14.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol WindowProtocol {

    var window: UIWindow? { get }
    
}

extension WindowProtocol where Self: UIViewController {

    var window: UIWindow? {
        return view.window
    }
    
}

extension WindowProtocol where Self: UIView {
    
    var window: UIWindow? {
        return window
    }
    
}
