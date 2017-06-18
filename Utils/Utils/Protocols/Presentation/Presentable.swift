//
//  PresentationProtocol.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 31.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

public typealias CompletionHandler = () -> Void

protocol Presentable {
    
    func show(animated: Bool, completion: CompletionHandler?)
}

extension Presentable where Self: UIViewController {
    
    func show(animated: Bool, completion: CompletionHandler?) {
        let controller = UIViewController()
        _ = UIWindow.normalWindow(rootController: controller)
        controller.present(self,
                           animated: true,
                           completion: completion)
        
    }
    
}
