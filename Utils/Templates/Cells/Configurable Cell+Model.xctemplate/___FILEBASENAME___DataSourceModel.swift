//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit
import Foundation

protocol ___FILEBASENAMEASIDENTIFIER___Displaying {
    
}

class ___FILEBASENAMEASIDENTIFIER___: DataSourceModel {
    
    private(set) var reuseIdentifier: String
    private let model: <#ModelType#>
    
    init(with objectModel: <#ModelType#>, cellIdentifier: String) {
        self.model = objectModel
        self.reuseIdentifier = cellIdentifier
    }
    
}

extension ___FILEBASENAMEASIDENTIFIER___: ___FILEBASENAMEASIDENTIFIER___Displaying {
    
    
}
