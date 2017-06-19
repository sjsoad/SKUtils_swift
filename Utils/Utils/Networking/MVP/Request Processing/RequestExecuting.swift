//
//  RequestExecutingViewProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SwiftyDrop

typealias RequestExecutingHandler = (_ executing: Bool, _ error: Error?) -> Void

protocol RequestExecuting {
    
    func activityView() -> ActivityViewable?
    func requerstExecutingHandler() -> RequestExecutingHandler
    
}

extension RequestExecuting where Self: NSObject {
    
    func requerstExecutingHandler() -> RequestExecutingHandler {
        return { [weak self] (executing, error) in
            guard let strongSelf = self,
            let view = strongSelf.activityView() else { return }
            if executing {
                view.showActivity()
            } else {
                view.hideActivity()
            }
            guard let error = error else { return }
            view.show(error: error.localizedDescription)
        }
    }
    
}
