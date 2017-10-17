//
//  QueryStringParser.swift
//  GeoTouch
//
//  Created by Sergey on 15.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

class QueryStringParser: NSObject {

    static func parameter(named name: String, fromURL url: String?) -> String? {
        if let url = url,
            let urlComponents = URLComponents(string: url),
            let queryItems = (urlComponents.queryItems),
            let item = queryItems.filter({ (item) in item.name == name }).first {
            return item.value
        }
        return nil
    }
}
