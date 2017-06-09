//
//  RequestErrorHandlerProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation
import NVActivityIndicatorView


protocol ActivityProtocol: NVActivityIndicatorViewable, ToastProtocol {
    
    func showActivity()
    func hideActivity()
    
}

extension ActivityProtocol where Self: UIViewController {
    
    func showActivity() {
        startAnimating()
    }
    
    func hideActivity() {
        stopAnimating()
    }
    


}
