//
//  QueryStringParser.swift
//  GeoTouch
//
//  Created by Sergey on 15.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

class QueryStringParser: NSObject {

    static func queryStringParameter(url: String?,
                                     param: String) -> String? {
        if let url = url,
            let urlComponents = URLComponents(string: url),
            let queryItems = (urlComponents.queryItems) {
            return queryItems.filter({ (item) in item.name == param }).first?.value!
        }
        return nil    }
}
