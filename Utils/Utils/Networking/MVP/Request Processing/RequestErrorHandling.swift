//
//  RequestErrorHandlerProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

protocol RequestErrorHandling {
    
    func requestErrorHandler(executingHandler handler: RequerstExecutingHandler?) -> ErrorHandler
    
}

extension RequestErrorHandling where Self: NSObject {
    
    func requestErrorHandler(executingHandler handler: RequerstExecutingHandler?) -> ErrorHandler {
        return { error in
            if let executingHandler = handler {
                executingHandler(false, error)
            }
        }
    }

}
