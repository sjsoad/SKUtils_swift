//
//  AlertPresentationProtocol.swift
//  SKUtilsSwift
//
//  Created by Mac on 03.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

protocol AlertPresentation: Presentation {
    
}

extension AlertPresentation where Self: UIViewController {
    
    func show(animated: Bool, completion: CompletionHandler?) {
        let controller = UIViewController()
        _ = WindowBuilder.alertWindow(rootController: controller)
        controller.present(self,
                           animated: true,
                           completion: completion)
    }
    
}
