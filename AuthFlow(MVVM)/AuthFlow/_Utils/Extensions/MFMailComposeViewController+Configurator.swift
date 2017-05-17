//
//  MFMailComposeViewController+Configurator.swift
//  SKUtilsSwift
//
//  Created by Mac on 09.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import MessageUI

public typealias MailConfigurator = (MFMailComposeViewController) -> Void

extension MFMailComposeViewController {
    
    func configure(configurator: MailConfigurator?) -> MFMailComposeViewController {
        if let configurator = configurator {
            configurator(self)
        }
        return self
    }
    
}
