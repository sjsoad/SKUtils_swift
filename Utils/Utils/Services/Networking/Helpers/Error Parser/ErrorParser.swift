//
//  ErrorParser.swift
//  Place
//
//  Created by Sergey on 18.08.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import Foundation

class ErrorParser {

    class func checkForError(JSON: AnyObject) -> Error? {
        guard let json = JSON as? [String: Any] else { return nil }
        if let message = json["error_message"] as? String {
            return ErrorParser.error(with: message)
        }
        return nil
    }

    private static func error(with message: String) -> NSError {
        return NSError(domain: /*API.host*/ "", code: 400, userInfo: [NSLocalizedDescriptionKey: message])
    }
    
}
