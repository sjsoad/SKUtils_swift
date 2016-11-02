//
//  AlertBuilder.swift
//  SKUtilsSwift
//
//  Created by Mac on 02.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

struct AlertConfigurator {
    var title : String
    var message : String
    var settingsButtonTitle : String
    var cancelButtonTitle : String
}

//class AlertConfiguratorTest: NSObject {
//    
//    var title : String?
//    var message : String?
//    var actions: [UIAlertAction]?
//    var preferredStyle: UIAlertControllerStyle
//    
//    override init() {
//    }
//}

class AlertBuilder: NSObject {

    public func alert(withConfigurator configurator: AlertConfigurator) -> UIAlertController {
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        
        return alert
    }
    
}
