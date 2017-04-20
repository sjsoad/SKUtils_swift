//
//  PresentationProtocol.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 31.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

public typealias CompletionHandler = () -> Void

protocol Presentation {
    
    func show(animated: Bool, completion: CompletionHandler?)
}

extension Presentation {
    
    func show(animated: Bool, completion: CompletionHandler?) {
        let controller = UIViewController()
        _ = WindowBuilder.normalWindow(rootController: controller)
        controller.present(self as! UIViewController,
                           animated: true,
                           completion: completion)
        
    }
    
}
