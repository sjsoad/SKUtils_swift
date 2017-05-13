//
//  ShareHelper.swift
//  GeoTouch
//
//  Created by Sergey on 06.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ShareHelper: NSObject {

    class func share(items: [Any],
                     applicationActivities: [UIActivity]?,
                     sender: UIBarButtonItem?,
                     from controller: UIViewController) {
    
        let activityViewController = UIActivityViewController(
            activityItems: items,
            applicationActivities: nil)
        if let popoverPresentationController = activityViewController.popoverPresentationController {
            popoverPresentationController.barButtonItem = sender
        }
        controller.present(activityViewController,
                           animated: true,
                           completion: nil)
    }
    
}
