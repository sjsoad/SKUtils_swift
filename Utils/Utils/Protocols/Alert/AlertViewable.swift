//
//  ToastProtocol.swift
//  Nioxin
//
//  Created by Sergey on 09.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit
import Foundation
import SwiftyDrop

protocol AlertViewable {
    
    func show(message: String, state: DropState)
    
}

extension AlertViewable {
    
    func show(message: String, state: DropState) {
        Drop.down(message,
                  state: state)
    }
    
}
