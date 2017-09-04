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
        let originalSize = self.size
        var scaleFactor: CGFloat = 1.0
        if originalSize.width > originalSize.height {
            scaleFactor = originalSize.width / size.width
        } else {
            scaleFactor = originalSize.height / size.height
        }
        let newSize = CGSize(width: originalSize.width / scaleFactor, height: originalSize.height / scaleFactor)
        return newSize
    }

    func size(thatFills size: CGSize) -> CGSize {
        let originalSize = self.size
        var scaleFactor: CGFloat = 1.0
        if originalSize.width < originalSize.height {
            scaleFactor = originalSize.width / size.width
        } else {
            scaleFactor = originalSize.height / size.height
        }
        let newSize = CGSize(width: originalSize.width / scaleFactor, height: originalSize.height / scaleFactor)
        return newSize
    }
    
    func image(withSize size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? UIImage()
    }
    
}
