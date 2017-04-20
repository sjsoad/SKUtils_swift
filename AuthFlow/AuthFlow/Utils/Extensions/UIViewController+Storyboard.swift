//
//  UIViewController+Storyboard.swift
//  GeoTouch
//
//  Created by Sergey on 21.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static func load<T: UIViewController>(from storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName,
                                      bundle: nil)
        let className = String(describing: self)
        let vc = storyboard.instantiateViewController(withIdentifier: className)
        return vc as! T
    }
}
