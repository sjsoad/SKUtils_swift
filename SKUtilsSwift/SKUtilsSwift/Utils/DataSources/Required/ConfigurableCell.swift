//
//  ConfigurableCell.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 06.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

protocol ConfigurableCell {
    
    static var reuseIdentifier: String { get }
    
    func configure<T>(viewModel: T)
}

extension ConfigurableCell where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
