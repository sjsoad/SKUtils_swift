//
//  MailHelper.swift
//  SKUtilsSwift
//
//  Created by Mac on 02.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import MessageUI

class MailHelper: NSObject {

    static func mailComposer() -> MFMailComposeViewController? {
        if MFMailComposeViewController.canSendMail() {
            let mailComposerVC = MFMailComposeViewController()
            return mailComposerVC
        }
        return nil
    }
    
}
