//
//  String+NSRange.swift
//  Nioxin
//
//  Created by Sergey on 22.05.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import Foundation

extension String {

    func nsrange(of string: String) -> NSRange {
        let nsstring = self as NSString
        return nsstring.range(of: string)
    }

    func nsrange() -> NSRange {
        return NSMakeRange(0, self.count)
    }
    
}
