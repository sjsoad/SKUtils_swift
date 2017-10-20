//
//  Dictionary+JSON.swift
//  Place
//
//  Created by Sergey on 20.10.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func jsonString() -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: jsonData, encoding: .utf8) ?? ""
        } catch {
            print(error.localizedDescription)
        }
        return ""
    }
    
}
