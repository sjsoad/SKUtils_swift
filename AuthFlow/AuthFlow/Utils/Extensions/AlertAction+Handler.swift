//
//  AlertAction+Handler.swift
//  SKUtilsSwift
//
//  Created by Mac on 07.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertAction {

    func addHandler(handler: ((UIAlertAction) -> Swift.Void)? = nil) -> UIAlertAction {
        return UIAlertAction.init(title: self.title,
                                  style: self.style,
                                  handler: handler)
    }
    
}
