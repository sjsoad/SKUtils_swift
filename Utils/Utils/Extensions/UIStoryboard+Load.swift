//
//  UIViewController+Storyboard.swift
//  GeoTouch
//
//  Created by Sergey on 21.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func load<T: UIViewController>(controller type: T.Type,
                     from storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName,
                                      bundle: nil)
        let className = String(describing: type)
        let vc = storyboard.instantiateViewController(withIdentifier: className)
        return vc as! T
    }
    
}
