//
//  RequestErrorHandlerProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

protocol ActivityViewable: NVActivityIndicatorViewable, AlertViewable {
    
    func showActivity()
    func hideActivity()
    
}

extension ActivityViewable where Self: UIViewController {
    
    func showActivity() {
        startAnimating()
    }
    
    func hideActivity() {
        stopAnimating()
    }
    
}
