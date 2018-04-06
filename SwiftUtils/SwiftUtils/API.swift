//
//  API.swift
//  SwiftUtils
//
//  Created by Sergey on 06.04.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

struct API {
    
    static func headers(with token: String? = nil) -> [String: String] {
        guard let token = token else { return ["Content-Type": "application/json"] }
        return ["Content-Type": "application/json",
                "Authorization": "Bearer \(token)"]
    }
    
}
