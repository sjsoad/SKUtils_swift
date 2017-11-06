//
//  Image+Resize.swift
//  Place
//
//  Created by Sergey on 04.09.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import UIKit

extension UIImage {

    func isSizeLess(thanSize size: CGSize) -> Bool {
        return size.width > self.size.width && size.height > self.size.height
    }
    
    func size(thatFits size: CGSize) -> CGSize {
        let aspectWidth = calculateAspectWidth(width: size.width)
        let aspectHeight = calculateAspectHeight(height: size.height)
        let aspectRatio = minAspectRation(aspectWidth: aspectWidth, aspectHeight: aspectHeight)
        return newSize(with: aspectRatio)
    }

    func size(thatFills size: CGSize) -> CGSize {
        let aspectWidth = calculateAspectWidth(width: size.width)
        let aspectHeight = calculateAspectHeight(height: size.height)
        let aspectRatio = maxAspectRation(aspectWidth: aspectWidth, aspectHeight: aspectHeight)
        return newSize(with: aspectRatio)
    }
    
    func image(withSize size: CGSize) -> UIImage? {
        var scaledImageRect = CGRect.zero
        scaledImageRect.size = size
        return drawImage(in: scaledImageRect)
    }
    
    // MARK: - Private -
    
    private func drawImage(in rect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        draw(in: rect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
    private func calculateAspectWidth(width: CGFloat) -> CGFloat {
        return width / size.width
    }
    
    private func calculateAspectHeight(height: CGFloat) -> CGFloat {
        return height / size.height
    }
    
    private func minAspectRation(aspectWidth: CGFloat, aspectHeight: CGFloat) -> CGFloat {
        return min(aspectWidth, aspectHeight)
    }
    
    private func maxAspectRation(aspectWidth: CGFloat, aspectHeight: CGFloat) -> CGFloat {
        return max(aspectWidth, aspectHeight)
    }
    
    private func newSize(with aspectRatio: CGFloat) -> CGSize {
        var newSize = CGSize.zero
        newSize.width = size.width * aspectRatio
        newSize.height = size.height * aspectRatio
        return newSize
    }
    
}
