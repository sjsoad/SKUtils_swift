//
//  RequestErrorHandlerProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation
import SwiftyDrop

protocol RequestErrorHandling: RequestExecuting {
    
    func requestErrorHandler() -> ErrorHandler
    
}

extension RequestErrorHandling where Self: NSObject {
    
    func requestErrorHandler() -> ErrorHandler {
        return { [weak self] error in
            guard let view = self?.activityView() else { return }
            view.show(error: error.localizedDescription)
        }
    }

}
