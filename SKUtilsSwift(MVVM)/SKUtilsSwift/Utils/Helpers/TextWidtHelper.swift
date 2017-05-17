//
//  TextWidtHelper.swift
//  GeoTouch
//
//  Created by Sergey on 16.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation
import UIKit

class TextWidtHelper: NSObject {
    
    class func textWidth(text: String,
                         font: UIFont,
                         padding: CGFloat) -> CGFloat {
        let label = UILabel()
        label.text = text
        label.font = font
        label.sizeToFit()
        let frame = label.frame
        return (frame.width + padding)
    }
    
}
