//
//  RequestExecutingProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

typealias RequerstExecutingHandler = (_ executing: Bool, _ error: Error?) -> Void

protocol RequestExecutingProtocol {

    var requerstExecutingHandler: RequerstExecutingHandler? { get set }
    
}
