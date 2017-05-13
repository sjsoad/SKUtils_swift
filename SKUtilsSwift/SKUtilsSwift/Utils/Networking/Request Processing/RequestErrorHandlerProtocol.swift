//
//  RequestErrorHandlerProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

protocol RequestErrorHandlerProtocol {
    
    func requestErrorHandler(executingHandler handler: RequerstExecutingHandler?) -> ErrorHandler
    
}

extension RequestErrorHandlerProtocol where Self: NSObject {
    
    func requestErrorHandler(executingHandler handler: RequerstExecutingHandler?) -> ErrorHandler {
        return { error in
            if let executingHandler = handler {
                executingHandler(false, error)
            }
        }
    }

}
