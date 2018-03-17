//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit
import Foundation

// Transform DataSourceModel in cell to this protocol to receive ui data
protocol ___FILEBASENAMEASIDENTIFIER___Displaying {
    
}

// Transform DataSourceModel in presenter to this protocol to receive data
protocol ___FILEBASENAMEASIDENTIFIER___DataProviding {
    
}

class ___FILEBASENAMEASIDENTIFIER___: DataSourceModel {
    
    private(set) var reuseIdentifier: String
    private let model: <#ModelType#>
    
    init(with objectModel: <#ModelType#>, cellIdentifier: String) {
        self.model = objectModel
        self.reuseIdentifier = cellIdentifier
    }
    
}

// MARK: - ___FILEBASENAMEASIDENTIFIER___Displaying -

extension ___FILEBASENAMEASIDENTIFIER___: ___FILEBASENAMEASIDENTIFIER___Displaying {
    
    
}

// MARK: - ___FILEBASENAMEASIDENTIFIER___DataProviding -

extension ___FILEBASENAMEASIDENTIFIER___: ___FILEBASENAMEASIDENTIFIER___DataProviding {
    
    
}
