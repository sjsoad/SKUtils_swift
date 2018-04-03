//
//  ErrorParsingService.swift
//  Place
//
//  Created by Sergey on 18.08.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import Foundation

class ErrorParsingService {

    func parseError(from JSON: AnyObject) -> Error? {
        // TODO: - Parse error format -
        guard let json = JSON as? [String: Any] else { return nil }
        if let messages = json["message"] as? [String: String] {
            let values = messages.compactMap({ (_, value) -> String? in
                return value
            })
            return ErrorFactory.error(with: values.joined(separator: ". "))
        }
        if let message = json["error_description"] as? String {
            return ErrorFactory.error(with: message)
        }
        
        return nil
    }
}

class ErrorFactory {
    
    class func error(with message: String) -> NSError {
        return NSError(domain: "API.host", code: 400, userInfo: [NSLocalizedDescriptionKey: message])
    }
    
}
