//
//  DismissProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 21.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol DismissNavigationProtocol {
    
    static func dismiss(controller: UIViewController,
                        animated: Bool,
                        completion: (() -> Swift.Void)?)
    
}

extension DismissNavigationProtocol {
    
    static func dismiss(controller: UIViewController,
                        animated: Bool,
                        completion: (() -> Swift.Void)? = nil) {
        controller.dismiss(animated: animated,
                           completion: completion)
    }
    
}
