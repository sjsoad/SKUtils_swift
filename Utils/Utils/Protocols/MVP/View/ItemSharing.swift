//
//  ItemSharing.swift
//  Yada
//
//  Created by Sergey on 02.04.2018.
//Copyright © 2018 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol ItemsSharing {

    var excludedActivityTypes: [UIActivityType]? { get }
    var sharingActionsender: UIBarButtonItem? { get }
    
    func share(with items: [Any])
    
}

extension ItemsSharing where Self: UIViewController {

    var excludedActivityTypes: [UIActivityType]? { return nil }
    var sharingActionsender: UIBarButtonItem? { return nil }
    
    func share(with items: [Any]) {
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityViewController.excludedActivityTypes = excludedActivityTypes
        if let popoverPresentationController = activityViewController.popoverPresentationController {
            popoverPresentationController.barButtonItem = sharingActionsender
        }
        present(activityViewController, animated: true, completion: nil)
    }
    
}
