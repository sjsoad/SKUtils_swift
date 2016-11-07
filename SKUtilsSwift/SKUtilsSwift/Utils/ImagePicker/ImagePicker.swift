//
//  ImagePicker.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

/* -------------------------------------------------------------------------------------------------------------------------
var imagePicker: ImagePicker = {
    let alertTitles = AlertTitles(title: "Service",
                                  message: "Service is disabled! Please turn on it in Settings",
                                  actionButtonTitle: "Go to Settings",
                                  cancelButtonTitle: "Cancel")
    let cameraPermissions = CameraPermissions(settingAlertTitles: alertTitles)
    let libraryPermissions = PhotoLibraryPermissions(settingAlertTitles: alertTitles)
    let imagePicker = ImagePicker(configurationHandler: {picker in
        print(picker)
    },
                                  cameraPermissions: cameraPermissions,
                                  libraryPermissions: libraryPermissions)
    imagePicker.imagePickerController.delegate = imagePicker
    return imagePicker
}()
---------------------------------------------------------------------------------------------------------------------------- */

import UIKit

public typealias PickerConfigurator = (UIImagePickerController) -> Void
public typealias SelectionHandler     = (UIImagePickerController, [String : Any]) -> Void
public typealias CancelHandler        = (UIImagePickerController) -> Void

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagePickerController: UIImagePickerController
    var configurationHandler: PickerConfigurator? {
        didSet {
            if let configurationHandler = self.configurationHandler {
                configurationHandler(self.imagePickerController)
            }
        }
    }
    var selectionHandler: SelectionHandler?
    var cancelHandler: CancelHandler?
    var cameraPermissions: CameraPermissions
    var libraryPermissions: PhotoLibraryPermissions
    
    init(configurationHandler: PickerConfigurator?,
         cameraPermissions: CameraPermissions,
         libraryPermissions: PhotoLibraryPermissions) {
        
        self.imagePickerController = UIImagePickerController()
        self.cameraPermissions = cameraPermissions
        self.libraryPermissions = libraryPermissions
        self.configurationHandler = configurationHandler
        if let config = self.configurationHandler {
            config(self.imagePickerController)
        }
    }
    
    func show(selectionHandler: SelectionHandler?,
              cancelHandler: CancelHandler?,
              completionHandler: CompletionHandler?) {
        self.selectionHandler = selectionHandler;
        self.cancelHandler = cancelHandler;
        switch self.imagePickerController.sourceType {
        case .photoLibrary, .savedPhotosAlbum:
            self.showLibrary(completionHandler: completionHandler)
            break
        case .camera:
            self.showCamera(completionHandler: completionHandler)
            break
        }
    }
    
    //MARK: - Private
    
    fileprivate func showCamera(completionHandler: CompletionHandler?) {
        self.process(permissionsState: self.cameraPermissions.permissionsState(),
                     permissionsRequest: self.cameraPermissions,
                     completionHandler:  completionHandler)
    }
    
    fileprivate func showLibrary(completionHandler: CompletionHandler?) {
        self.process(permissionsState: self.libraryPermissions.permissionsState(),
                     permissionsRequest: self.libraryPermissions,
                     completionHandler:  completionHandler)
    }

    fileprivate func process(permissionsState: PermissionsState,
                             permissionsRequest: RequestPermissions,
                             completionHandler: CompletionHandler?) {
        switch permissionsState {
        case .permissionsNotAsked:
            permissionsRequest.requestPermissions(handler: { (state) in
                if state == .permissionsGranted {
                DispatchQueue.main.async {
                        self.process(permissionsState: state,
                                     permissionsRequest: permissionsRequest,
                                     completionHandler:  completionHandler)
                    }
                }
            })
            break
        case .permissionsGranted:
            self.imagePickerController.show(animated: true,
                                            completion: completionHandler)
            break
        default:
            break
        }
    }

    //MARK: - UIImagePickerControllerDelegate

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selection = self.selectionHandler {
            selection(self.imagePickerController, info)
        }
        picker.dismiss(animated: true,
                       completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        if let cancel = self.cancelHandler {
            cancel(self.imagePickerController)
        }
        picker.dismiss(animated: true,
                       completion: nil)
    }
    
}
