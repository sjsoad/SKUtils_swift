//
//  MailHelper.swift
//  SKUtilsSwift
//
//  Created by Mac on 02.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import MessageUI

public typealias MailConfigurator = (MFMailComposeViewController) -> Void

protocol MailProtocol {

    func showMailComposer(animated: Bool,
                          configurationHandler: MailConfigurator?,
                          completion: CompletionHandler?)
    
}

extension MailProtocol {
    
    func showMailComposer(animated: Bool,
                          configurationHandler: MailConfigurator?,
                          completion: CompletionHandler?) {
        if let vc = self as? UIViewController {
            let mail = MailBuilder.mailComposer()
            if let confoguration = configurationHandler {
                confoguration(mail)
            }
            vc.present(mail,
                       animated: animated,
                       completion: completion)
        }
    }
}
