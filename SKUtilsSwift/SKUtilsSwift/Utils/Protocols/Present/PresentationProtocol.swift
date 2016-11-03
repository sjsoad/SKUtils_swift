//
//  PresentationProtocol.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 31.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

public typealias completionHandler = () -> Void

protocol PresentationProtocol {
    
    func show(animated: Bool, completion: completionHandler?)
}

extension PresentationProtocol {
    
    func show(animated: Bool, completion: completionHandler?) {
        let controller = UIViewController()
        _ = WindowBuilder.normalWindow(rootController: controller)
        controller.present(self as! UIViewController,
                           animated: true,
                           completion: completion)
        
    }
    
}
