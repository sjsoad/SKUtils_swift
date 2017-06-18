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
    
    func show(error: String?)
    
}

extension AlertViewable {
    
    func show(error: String?) {
        guard let error = error else { return }
        Drop.down(error,
                  state: .error)
    }
    
}
