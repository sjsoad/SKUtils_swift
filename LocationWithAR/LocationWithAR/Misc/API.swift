//
//  API.swift
//  LocationWithAR
//
//  Created by Sergey on 28.02.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

struct API {
    
    struct Defaults {
        static func headers(with token: String? = nil) -> [String: String] {
            guard let token = token else { return ["Content-Type": "application/json"] }
            return ["Content-Type": "application/json",
                    "Authorization": "Bearer \(token)"]
        }
    }
    
    struct Place {
        static var places: String { return ["https://maps.googleapis.com",
                                            "maps",
                                            "api",
                                            "place",
                                            "nearbysearch",
                                            "json"].joined(separator: "/") }
    }
    
}
