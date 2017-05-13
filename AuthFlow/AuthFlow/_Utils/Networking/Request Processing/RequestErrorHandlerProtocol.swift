//
//  RequestErrorHandlerProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

protocol RequestErrorHandlerProtocol: RequestExecutingProtocol {
    
    func requestErrorHandler() -> ErrorHandler
    
}

extension RequestErrorHandlerProtocol where Self: NSObject {
    
    func requestErrorHandler() -> ErrorHandler {
        return { [weak self] error in
            guard let strongSelf = self else { return }
            if let executingHandler = strongSelf.requerstExecutingHandler {
                executingHandler(false, error)
            }
        }
    }

}
