//
//  MailComposer+PresentableProtocol.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 31.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import MessageUI

extension MFMailComposeViewController {

    func show(animated: Bool, completion: CompletionHandler?) {
        let controller = UIViewController()
        _ = UIWindow.normalWindow(rootController: controller)
        controller.present(self,
                           animated: true,
                           completion: completion)
        
    }
    
}
