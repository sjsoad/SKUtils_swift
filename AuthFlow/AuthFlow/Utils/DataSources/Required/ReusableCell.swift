//
//  ReusableCell.swift
//  GeoTouch
//
//  Created by Sergey on 20.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

extension ReusableCell where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
