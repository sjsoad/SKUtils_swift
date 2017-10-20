//
//  String+JSON.swift
//  Place
//
//  Created by Sergey on 20.10.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import Foundation

extension String {
    
    func dictionary() -> [String: Any]? {
        guard let jsonData = self.data(using: .utf8),
            let decoded = try? JSONSerialization.jsonObject(with: jsonData, options: []) else { return nil }
        return decoded as? [String: Any]
    }
    
}
