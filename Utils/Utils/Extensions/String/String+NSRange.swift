//
//  String+NSRange.swift
//  Nioxin
//
//  Created by Sergey on 22.05.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import Foundation

extension String {

    func nsranges(of string: String) -> [NSRange] {
        guard let regex = try? NSRegularExpression(pattern: string, options: []) else { return [] }
        let mathces = regex.matches(in: self, options: [], range: self.nsrange())
        return mathces.flatMap({ $0.range })
    }
    
    func nsrange(of string: String) -> NSRange {
        let nsstring = self as NSString
        return nsstring.range(of: string)
    }

    func nsrange() -> NSRange {
        return NSMakeRange(0, self.count)
    }
    
}
