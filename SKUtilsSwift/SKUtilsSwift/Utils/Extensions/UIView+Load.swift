//
//  UIView+Load.swift
//  MyWeather
//
//  Created by Mac on 20.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

extension UIView {

    public static func loadNib(named name: String? = nil) -> Any {
        let nibName = name ?? String(describing: self)
        let views = UINib(
            nibName: nibName,
            bundle: nil
            ).instantiate(withOwner: nil,
                          options: nil)
        return views[0]
    }

}
