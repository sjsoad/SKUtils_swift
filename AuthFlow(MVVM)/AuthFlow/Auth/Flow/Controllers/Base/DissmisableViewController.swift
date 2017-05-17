//
//  BaseViewController+Dismiss.swift
//  GeoTouch
//
//  Created by Sergey on 09.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class DissmisableViewController: BaseViewController {
    
    @IBAction func dismissButtonPressed() {
        baseNavigation.dismiss(controller: self,
                               animated: true)
    }

}
