//
//  AlertBuilder.swift
//  SKUtilsSwift
//
//  Created by Mac on 02.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

public typealias ActionHandler = (UIAlertAction, NSInteger?, UIAlertController) -> Void

class AlertConfigurator: NSObject {
    
    var title : String?
    var message : String?
    var actions: [UIAlertAction]?
    var actionHandler: ActionHandler?
    var preferredStyle: UIAlertControllerStyle
    
    init(title : String?,
         message : String?,
         actions: [UIAlertAction]?,
         actionHandler: ActionHandler?,
         preferredStyle: UIAlertControllerStyle) {
        self.title = title
        self.message = message
        self.actions = actions
        self.actionHandler = actionHandler
        self.preferredStyle = preferredStyle
    }
}

class AlertBuilder: NSObject {

    static func alert(configurator: AlertConfigurator) -> UIAlertController {
        let alert = UIAlertController(title: configurator.title,
                                      message: configurator.message,
                                      preferredStyle: configurator.preferredStyle)
        AlertBuilder.addActions(alert: alert, configurator: configurator)
        return alert
    }
    
    //MARK: - Private
    
    fileprivate static func addActions(alert: UIAlertController, configurator: AlertConfigurator) {
        if let actions = configurator.actions {
            for action in actions {
                if configurator.actionHandler != nil {
                    let actionWithHandler = action.addHandler(handler: { (action) in
                        let index = alert.actions.index(of: action)
                        if let handler = configurator.actionHandler {
                            handler(action, index, alert)
                        }
                    })
                    alert.addAction(actionWithHandler)
                }
                else {
                    alert.addAction(action)
                }
            }
        }
    }
    
}
