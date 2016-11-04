//
//  MailBuilder.swift
//  SKUtilsSwift
//
//  Created by Mac on 03.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import MessageUI

class MailBuilder: NSObject {

    func mailComposer(body: String?,
                      isHTML: Bool,
                      subject: String?,
                      toRecipients: [String]?,
                      ccRecipients: [String]?,
                      bccRecipients: [String]?) {
        let mailComposerVC = MFMailComposeViewController()
        if let body = body {
            mailComposerVC.setMessageBody(body, isHTML: isHTML)
        }
        
    }
    
}
