//
//  DoubleExtension.swift
//  MyWeather
//
//  Created by Mac on 07.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

class Converter: NSObject {
   
    static func stringOrEmpty<T>(value: T?,
                              format: String? = nil) -> String {
        if let value = Converter.stringOrNil(value: value,
                                             format: format) {
            return value
        }
        return ""
    }
    
    static func stringOrNil<T>(value: T?,
                            format: String? = nil) -> String? {
        if let format = format, let value = value {
            return String(format: format, value as! CVarArg)
        }
        if let value = value {
            return "\(value)"
        }
        
        return nil
    }

}
