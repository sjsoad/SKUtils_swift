//
//  TabBarItem.swift
//  ShadeChartsWella
//
//  Created by Sergey on 21.11.2017.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

extension UITabBarItem {
    
    convenience init(title: String,
                     image: UIImage?,
                     selectedImage: UIImage?,
                     font: UIFont) {
        self.init(title: title, image: image, selectedImage: selectedImage)
        setTitleTextAttributes([.font: font], for: .normal)
    }
    
}
