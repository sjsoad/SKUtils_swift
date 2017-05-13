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

protocol RequestExecutingViewProtocol: NVActivityIndicatorViewable {
    
    func requerstExecutingHandler() -> RequerstExecutingHandler
    
}

extension RequestExecutingViewProtocol where Self: UIViewController {
    
    func requerstExecutingHandler() -> RequerstExecutingHandler {
        return { [weak self] executing, error in
            guard let strongSelf = self else { return }
            if executing {
                strongSelf.startAnimating()
            }
            else {
                strongSelf.stopAnimating()
            }
            if let err = error {
                Drop.down(err.localizedDescription,
                          state: .error)
            }
        }
    }
    
}
