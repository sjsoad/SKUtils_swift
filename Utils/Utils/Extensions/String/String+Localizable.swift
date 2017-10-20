//
//  String+Localizable.swift
//  ShadeCharts
//
//  Created by Evgeniy Leychenko on 17.03.17.
//  Copyright © 2017 theappsolutions.com. All rights reserved.
//

import Foundation

extension String {
    
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
