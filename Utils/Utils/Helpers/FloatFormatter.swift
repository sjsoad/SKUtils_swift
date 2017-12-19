//
//  FloatFormatter.swift
//  ShadeChartsWella
//
//  Created by Sergey on 08.12.2017.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class FloatFormatter: NSObject {

    // removes 0 after dot
    class func string(from value: CGFloat) -> String {
        let number = NSNumber(value: Float(value))
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter.string(from: number) ?? ""
    }
    
}
