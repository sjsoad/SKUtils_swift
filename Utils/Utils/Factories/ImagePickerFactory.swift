//
//  ImagePickerFactory.swift
//  Yada
//
//  Created by Sergey on 02.03.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation
import UIKit

class ImagePickerFactory {
    
    class func imagePicker(sourceType: UIImagePickerControllerSourceType,
                           delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate,
                           allowEdititng: Bool) -> UIImagePickerController? {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = delegate
            imagePicker.sourceType = sourceType
            imagePicker.allowsEditing = allowEdititng
            return imagePicker
        }
        return nil
    }
    
}
