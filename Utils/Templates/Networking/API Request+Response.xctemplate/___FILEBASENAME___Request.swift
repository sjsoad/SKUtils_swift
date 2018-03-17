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

class ___FILEBASENAMEASIDENTIFIER___: APIRequesting {
    
    typealias Response = ___VARIABLE_fileName:identifier___Response
    
    var HTTPMethod: Method {
        return .<#post#>
    }
    var headers: [String: String]?
    
    private(set) var parameters: [String : Any]?
    private(set) var path: String
    
    required init(withURL url: String,
                  parameters: [String : Any]? = nil,
                  headers: [String : String]? = nil) {
        self.parameters = parameters
        self.headers = headers
        self.path = url
    }
    
}
