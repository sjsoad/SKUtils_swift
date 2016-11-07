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

    static func mailComposer() -> MFMailComposeViewController {
        return MFMailComposeViewController()
    }
}
