//
//  MailHelper.swift
//  SKUtilsSwift
//
//  Created by Mac on 02.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import MessageUI

protocol MailComposer {

    func showMailComposer(animated: Bool,
                          configurationHandler: MailConfigurator?,
                          completion: CompletionHandler?)
    
}

extension MailComposer {
    
    func showMailComposer(animated: Bool,
                          configurationHandler: MailConfigurator?,
                          completion: CompletionHandler?) {
        if let vc = self as? UIViewController {
            let mail = MailBuilder.mailComposer().configure(configurator: configurationHandler)
            vc.present(mail,
                       animated: animated,
                       completion: completion)
        }
    }
}
