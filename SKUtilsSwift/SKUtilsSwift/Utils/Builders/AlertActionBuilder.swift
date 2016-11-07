//
//  AlertActionBuilder.swift
//  SKUtilsSwift
//
//  Created by Mac on 07.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class AlertActionBuilder: NSObject {

    static func cancelAction(title: String?) -> UIAlertAction {
        return UIAlertAction.init(title: title,
                                  style: .cancel,
                                  handler: nil)
    }
    
    static func destructiveAction(title: String?) -> UIAlertAction {
        return UIAlertAction.init(title: title,
                                  style: .destructive,
                                  handler: nil)
    }

    static func defaultAction(title: String?) -> UIAlertAction {
        return UIAlertAction.init(title: title,
                                  style: .default,
                                  handler: nil)
    }
    
}
