//
//  UIView+Load.swift
//  MyWeather
//
//  Created by Mac on 20.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

extension UIView {
    
    public class func loadNib<T: UIView>(named name: String) -> T? {
        guard let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil) else { return nil }
        for nibView in nibViews {
            if let view = nibView as? T {
                return view
            }
        }
        return nil
    }
    
}
