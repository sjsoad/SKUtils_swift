//
//  ConfigurableCell.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 06.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

protocol ConfigurableCell: ReusableCell {
    
    func configure<T>(viewModel: T)
}
