//
//  AlertActionBuilder.swift
//  SKUtilsSwift
//
//  Created by Mac on 07.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class AlertActionBuilder: NSObject {
    
    static func cancelAction(title: String?,
                             handler: ((UIAlertAction) -> Swift.Void)? = nil) -> UIAlertAction {
        return UIAlertAction.init(title: title,
                                  style: .cancel,
                                  handler: handler)
    }
    
    static func destructiveAction(title: String?,
                                  handler: ((UIAlertAction) -> Swift.Void)? = nil) -> UIAlertAction {
        return UIAlertAction.init(title: title,
                                  style: .destructive,
                                  handler: handler)
    }
    
    static func defaultAction(title: String?,
                              handler: ((UIAlertAction) -> Swift.Void)? = nil) -> UIAlertAction {
        return UIAlertAction.init(title: title,
                                  style: .default,
                                  handler: handler)
    }
    
}
