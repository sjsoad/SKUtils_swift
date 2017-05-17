//
//  RequestErrorHandlerProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
import SwiftyDrop

protocol ActivityProtocol: NVActivityIndicatorViewable {
    
    func showActivity()
    func hideActivity()
    func show(error: String?)
    
}

extension ActivityProtocol where Self: UIViewController {
    
    func showActivity() {
        startAnimating()
    }
    
    func hideActivity() {
        stopAnimating()
    }
    
    func show(error: String?) {
        guard let error = error else { return }
        Drop.down(error,
                  state: .error)
    }

}
