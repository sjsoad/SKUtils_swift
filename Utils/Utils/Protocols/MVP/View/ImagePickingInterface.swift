//
//  ImagePickingInterface.swift
//  Yada
//
//  Created by Sergey on 07.03.2018.
//Copyright © 2018 Sergey. All rights reserved.
//

import UIKit
import Foundation

// Extend your UIViewController with this protocol

protocol ImagePickerAlertConfigurating: UIImagePickerControllerDelegate, UINavigationControllerDelegate where Self: UIViewController {
    
    var imagePickerAlertTitle: String? { get }
    var imagePickerAlertMessage: String? { get }
    var imagePickerAlertCameraTitle: String? { get }
    var imagePickerAlertLibraryTitle: String? { get }
    var imagePickerAlertCancelTitle: String? { get }
    var cameraSelectionHandler: (() -> Void)? { get }
    var librarySelectionHandler: (() -> Void)? { get }
    
}

// Extend your Interface protocol with this protocol

protocol ImagePickingInterface {

    func showImagePickerAlert()
    func showImagePicker(with sourceType: UIImagePickerControllerSourceType)
    
}

extension ImagePickingInterface where Self: ImagePickerAlertConfigurating {

    func showImagePickerAlert() {
        let actionSheet = UIAlertController(title: imagePickerAlertTitle,
                                            message: imagePickerAlertMessage,
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction.defaultAction(title: imagePickerAlertCameraTitle, handler: { [weak self] (_) in
            self?.cameraSelectionHandler?()
        }))
        actionSheet.addAction(UIAlertAction.defaultAction(title: imagePickerAlertLibraryTitle, handler: { [weak self] (_) in
            self?.librarySelectionHandler?()
        }))
        actionSheet.addAction(UIAlertAction.cancelAction(title: imagePickerAlertCancelTitle))
        present(actionSheet, animated: true, completion: nil)
    }
    
    func showImagePicker(with sourceType: UIImagePickerControllerSourceType) {
        guard let imagePicker = ImagePickerFactory.imagePicker(sourceType: sourceType, delegate: self, allowEdititng: true) else { return }
        present(imagePicker, animated: true, completion: nil)
    }
    
}
