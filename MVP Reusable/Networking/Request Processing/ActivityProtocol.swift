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

extension ActivityProtocol {
    
    func showActivity() {
        startAnimationg()
    }
    
    func hideActivity() {
        stopAnimationg()
    }
    
    func show(error: String?) {
        Drop.down(err.localizedDescription,
                  state: .error)
    }

}
