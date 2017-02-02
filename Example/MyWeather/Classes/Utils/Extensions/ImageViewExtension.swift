//
//  ImageExtension.swift
//  MyWeather
//
//  Created by Mac on 29.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

extension UIImageView {
    
    @IBInspectable var imageColor: UIColor? {
        set {
            tintColor = newValue
        }
        get {
            return tintColor
        }
    }
    
}
