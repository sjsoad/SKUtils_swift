//
//  UIViewController+AppDelegate.swift
//  SKUtilsSwift
//
//  Created by Mac on 11.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}
