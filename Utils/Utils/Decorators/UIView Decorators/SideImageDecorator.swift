//
//  SideImageDecorator.swift
//  Nioxin
//
//  Created by Sergey on 21.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

enum Side {
    case left
    case right
}

class SideImageDecorator {

    fileprivate var imageName: String!
    fileprivate var viewOffset: CGFloat = 0
    fileprivate var textPadding: CGFloat = 0
    fileprivate var imageSide: Side = .left
    
    
    init(imageName name: String, viewOffset offset: CGFloat, textPadding padding: CGFloat, imageSide side: Side) {
        imageName = name
        viewOffset = offset
        textPadding = padding
        imageSide = side
    }

}

extension SideImageDecorator: Decorator {

    func decorate<Object>(component: Object) {
        guard let view = component as? UITextField,
            let image = UIImage(named: imageName) else { return }
        let imageView = createImageView()
        imageView.frame = imageViewFrame(dependsOn: image.size, height: view.frame.height)
        imageView.image = image
        if imageSide == .left {
            view.leftViewMode = .always
            view.leftView = imageView
        } else {
            view.rightViewMode = .always
            view.rightView = imageView
        }
    }

    private func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    private func imageViewFrame(dependsOn size: CGSize, height: CGFloat) -> CGRect {
        let y = (height - size.height) / 2.0
        let width = viewOffset + size.width + textPadding
        let height = size.height
        return CGRect(x: 0, y: y, width: width, height: height)
    }
    
}
