//
//  MailHelper.swift
//  SKUtilsSwift
//
//  Created by Mac on 02.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import MessageUI

//public typealias completionHandler = () -> Void

protocol MailProtocol: MFMailComposeViewControllerDelegate {

    var mailComposer: MFMailComposeViewController { get }
    func showMailComposer(animated: Bool, completion: completionHandler?)
    
}

extension MailProtocol {
    
    var mailComposer: MFMailComposeViewController {
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        return composer
    }
    
    func showMailComposer(animated: Bool, completion: completionHandler?) {
        if let vc = self as? UIViewController {
            vc.present(mailComposer,
                       animated: animated,
                       completion: completion)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
