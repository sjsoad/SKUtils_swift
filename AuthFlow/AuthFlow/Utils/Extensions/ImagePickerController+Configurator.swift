//
//  AlertController+Configurator.swift
//  SKUtilsSwift
//
//  Created by Mac on 09.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

public typealias ImagePickerConfigurator = (UIImagePickerController) -> Void

extension UIImagePickerController {
    
    func configure(configurator: ImagePickerConfigurator?) -> UIImagePickerController {
        if let configurator = configurator {
            configurator(self)
        }
        return self
    }
    
}
