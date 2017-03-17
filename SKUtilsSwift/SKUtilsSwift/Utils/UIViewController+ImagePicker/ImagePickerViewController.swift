//
//  ImagePickerViewController.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagePickerViewModel = ImagePickerViewModel()
    var imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.modalTransitionStyle = .coverVertical
        
        return imagePicker
    }()
    
    //MARK: - UIImagePickerController ActionSheet
    
    func showImagePickerActionSheet() {
        let camera = AlertActionBuilder.defaultAction(title: "Camera",
                                                      handler: { [weak self] action in
                                                        guard let strongSelf = self else { return }
                                                        strongSelf.showImagePickerWithSource(source: .camera)
        })
        let library = AlertActionBuilder.defaultAction(title: "Library",
                                                       handler: { [weak self] action in
                                                        guard let strongSelf = self else { return }
                                                        strongSelf.showImagePickerWithSource(source: .photoLibrary)
        })
        let cancelAction = AlertActionBuilder.cancelAction(title: "Cancel")
        let alertConfigurator = AlertConfigurator(title: "Take a photo",
                                                  message: nil,
                                                  actions: [camera,
                                                            library,
                                                            cancelAction],
                                                  actionHandler:nil,
                                                  preferredStyle: .actionSheet)
        let alert = AlertBuilder.alert(configurator: alertConfigurator)
        alert.show(animated: true, completion: nil)
    }
    
    func showImagePickerWithSource(source: UIImagePickerControllerSourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            imagePicker.delegate = self;
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    //MARK: - UIImagePickerController
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerViewModel.selectedImage.value = image
        }
        picker.dismiss(animated: true,
                       completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,
                       completion: nil)
    }
}
