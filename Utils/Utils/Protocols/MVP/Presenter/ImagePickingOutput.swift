//
//  ImagePickingOutput.swift
//  Yada
//
//  Created by Sergey on 07.03.2018.
//Copyright © 2018 Sergey. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import Photos

// Extend your Presenter with this protocol

protocol ImagePicking: class {
    
    // make private(set)
    var cameraPermissions: CameraPermissions? { get }
    var photoLibraryPermissions: PhotoLibraryPermissions? { get }
    
    func imagePickingInterface() -> ImagePickingInterface?
    func showImagePicker(with sourceType: UIImagePickerControllerSourceType)
    
}

extension ImagePicking {
    
    func showImagePicker(with sourceType: UIImagePickerControllerSourceType) {
        imagePickingInterface()?.showImagePicker(with: sourceType)
    }
    
}

// Extend your Output protocol with this protocol

protocol ImagePickingOutput {

    func viewTriggeredCallImagePickerEvent()
    func viewTriggeredSelectionOfPicker(sourceType: UIImagePickerControllerSourceType)
    func viewTriggedImageSelectionEvent(with info: [String : Any])
    
}

extension ImagePickingOutput where Self: ImagePicking {
    
    func viewTriggeredCallImagePickerEvent() {
        imagePickingInterface()?.showImagePickerAlert()
    }
    
    func viewTriggeredSelectionOfPicker(sourceType: UIImagePickerControllerSourceType) {
        if sourceType == .camera {
            checkCameraPermissions()
        }
        if sourceType == .photoLibrary {
            checkCameraRollPermissions()
        }
    }
    
    // MARK: - Private -
    
    private func checkCameraPermissions() {
        guard let cameraPermissions = cameraPermissions else { return }
        let state: AVAuthorizationStatus = cameraPermissions.permissionsState()
        if state == .notDetermined {
            cameraPermissions.requestPermissions(handler: { [weak self] (_) in
                self?.checkCameraPermissions()
            })
        }
        if state == .authorized {
            showImagePicker(with: .camera)
        }
        if state == .denied {
            cameraPermissions.showSettingsAlert()
        }
    }
    
    private func checkCameraRollPermissions() {
        guard let photoLibraryPermissions = photoLibraryPermissions else { return }
        let state: PHAuthorizationStatus = photoLibraryPermissions.permissionsState()
        if state == .notDetermined {
            photoLibraryPermissions.requestPermissions(handler: { [weak self] (_) in
                self?.checkCameraRollPermissions()
            })
        }
        if state == .authorized {
            showImagePicker(with: .photoLibrary)
        }
        if state == .denied {
            photoLibraryPermissions.showSettingsAlert()
        }
    }
    
}
