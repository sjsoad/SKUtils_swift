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

class ___FILEBASENAMEASIDENTIFIER___: APIMultipartRequesting {
    
    typealias Response = ___VARIABLE_fileName:identifier___Response
    
    var HTTPMethod: Method {
        return .<#post#>
    }
    var headers: [String: String]?
    
    private(set) var parameters: [String : Any]?
    private(set) var path: String
    private(set) var multipartData: Data
    private(set) var multipartKey: String
    private(set) var mimeType: String
    private(set) var fileName: String
    
    required init(withURL url: String,
                  multipartData: Data,
                  multipartKey: String,
                  mimeType: String,
                  fileName: String,
                  parameters: [String: Any]? = nil,
                  headers: [String: String]? = nil) {
        self.multipartData = multipartData
        self.multipartKey = multipartKey
        self.mimeType = mimeType
        self.fileName = fileName
        self.parameters = parameters
        self.headers = headers
        self.path = url
    }
    
}
