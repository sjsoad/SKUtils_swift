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

typealias RequerstExecutingHandler = (_ executing: Bool, _ error: Error?) -> Void

protocol RequestExecutingProtocol {
    
    var view: ActivityProtocol? { get }
    func requerstExecutingHandler() -> RequerstExecutingHandler
    
}

extension RequestExecutingProtocol where Self:  {
    
    func requerstExecutingHandler() -> RequerstExecutingHandler {
        return { [weak self] executing, error in
            guard let strongSelf = self else { return }
            if executing {
                view?.startAnimating()
            }
            else {
                view?.stopAnimating()
            }
            if let err = error {
                view?.show(error: error.localizedDescription)
            }
        }
    }
    
}
