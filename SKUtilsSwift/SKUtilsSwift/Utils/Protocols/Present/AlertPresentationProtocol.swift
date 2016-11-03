//
//  AlertPresentationProtocol.swift
//  SKUtilsSwift
//
//  Created by Mac on 03.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

protocol AlertPresentationProtocol: PresentationProtocol {
    
}

extension AlertPresentationProtocol {
    
    func show(animated: Bool, completion: completionHandler?) {
        let controller = UIViewController()
        _ = WindowBuilder.alertWindow(rootController: controller)
        controller.present(self as! UIViewController,
                           animated: true,
                           completion: completion)
        
    }
    
}

