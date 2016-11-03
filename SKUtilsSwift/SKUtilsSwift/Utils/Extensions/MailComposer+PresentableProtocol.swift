//
//  MailComposer+PresentableProtocol.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 31.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import MessageUI

extension MFMailComposeViewController: PresentationProtocol {

    func show(animated: Bool, completion: completionHandler?) {
        let controller = UIViewController()
        _ = WindowBuilder.normalWindow(rootController: controller)
        controller.present(self,
                           animated: true,
                           completion: completion)
        
    }
    
}
