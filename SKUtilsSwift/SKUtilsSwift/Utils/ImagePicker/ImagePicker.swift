//
//  ImagePicker.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

public typealias configurationHandler = (_ picker: UIImagePickerController) -> Void
public typealias selectionHandler     = (_ picker: UIImagePickerController, _ mediaInfo: [String : Any]) -> Void
public typealias cancelHandler        = (_ picker: UIImagePickerController) -> Void

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagePickerController: UIImagePickerController
    var selectionHandler: selectionHandler?
    var cancelHandler: cancelHandler?
    
    init(configurationHandler: configurationHandler?) {
        self.imagePickerController = UIImagePickerController()
        if let configurationHandler = configurationHandler {
            configurationHandler(self.imagePickerController)
        }
    }
    
    func show(selection: @escaping selectionHandler, cancel: @escaping cancelHandler) {
        self.selectionHandler = selection;
        self.cancelHandler = cancel;
        self.imagePickerController.show(animated: true, completion: nil)
    }
    
    //MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selection = self.selectionHandler {
            selection(self.imagePickerController, info)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        if let cancel = self.cancelHandler {
            cancel(self.imagePickerController)
        }
    }
    
}
