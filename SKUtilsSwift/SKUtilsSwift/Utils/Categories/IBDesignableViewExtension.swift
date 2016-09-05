//
//  Extentions.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 17.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable extension UIView {
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.CGColor }
        get { return layer.borderColor?.UIColor }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius  }
    }
}

extension CGColor {
    private var UIColor: UIKit.UIColor {
        return UIKit.UIColor(CGColor: self)
    }
}