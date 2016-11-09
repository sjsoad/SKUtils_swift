//
//  ImagePickerProtocol.swift
//  SKUtilsSwift
//
//  Created by Mac on 09.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

protocol ImagePicker {
    
    var imagePicker: UIImagePickerController { get }
    var cameraPermissions: CameraPermissions? { get }
    var libraryPermissions: PhotoLibraryPermissions? { get }
    
    func showPicker(completionHandler: CompletionHandler?)
}

extension ImagePicker {
    
    func showPicker(completionHandler: CompletionHandler?) {
        switch self.imagePicker.sourceType {
        case .camera:
            self.process(servicePermissions: self.cameraPermissions,
                         completionHandler:  completionHandler)
        case .photoLibrary, .savedPhotosAlbum:
            self.process(servicePermissions: self.libraryPermissions,
                         completionHandler:  completionHandler)
        }
    }
    
    //MARK: - Private
    
    fileprivate func process(servicePermissions: ServicePermissions?,
                             completionHandler: CompletionHandler?) {
        if let servicePermissions = servicePermissions {
            let permissionsState = servicePermissions.permissionsState()
            switch permissionsState {
            case .permissionsNotAsked:
                self.askPermissions(permissionsRequest: servicePermissions as? RequestPermissions,
                                    handler: { (state) in
                                        self.process(servicePermissions: servicePermissions,
                                                     completionHandler:  completionHandler)
                })
                break
            case .permissionsGranted:
                self.show(completionHandler: completionHandler)
                break
            default:
                break
            }
        }
        else {
            self.show(completionHandler: completionHandler)
        }
    }
    
    fileprivate func askPermissions(permissionsRequest: RequestPermissions?,
                                    handler: @escaping Handler) {
        
        if let permissionsRequest = permissionsRequest {
            permissionsRequest.requestPermissions(handler: { (state) in
                if state == .permissionsGranted {
                    DispatchQueue.main.async {
                        handler(state)
                    }
                }
            })
        }
    }
    
    fileprivate func show(completionHandler: CompletionHandler?) {
        self.imagePicker.show(animated: true,
                              completion: completionHandler)
    }
    
}
