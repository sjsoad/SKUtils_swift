//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//
// use APIClient for executing this requests

import UIKit
import Foundation

class ___FILEBASENAMEASIDENTIFIER___Request: APIRequestProtocol {
    
    typealias Response = ___FILEBASENAMEASIDENTIFIER___Response
    
    var HTTPMethod: Method {
        return .<#post#>
    }
    private(set) var parameters: [String : Any]?
    private(set) var headers: [String: String]?
    private(set) var path: String
    
    required init(withURL url: String,
                  parameters: [String : Any]? = nil,
                  headers: [String : String]? = nil) {
        self.parameters = parameters
        self.headers = headers
        self.path = url
    }
}
