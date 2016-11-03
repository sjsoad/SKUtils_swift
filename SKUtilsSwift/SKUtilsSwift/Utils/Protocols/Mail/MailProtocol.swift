//
//  MailHelper.swift
//  SKUtilsSwift
//
//  Created by Mac on 02.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import MessageUI

protocol MailProtocol {

    static func showMailComposer() -> MFMailComposeViewController?
    
}

extension MailProtocol {
    
    func showMailComposer() -> MFMailComposeViewController {
        return nil
    }
    
}
