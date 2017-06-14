//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import UIKit

protocol ___FILEBASENAMEASIDENTIFIER___Interface: class {
    
}

protocol ___FILEBASENAMEASIDENTIFIER___Output {
    
}

class ___FILEBASENAMEASIDENTIFIER___Presenter: NSObject {
    
    private weak var view: ___FILEBASENAMEASIDENTIFIER___Interface?
    
    init(with view: ___FILEBASENAMEASIDENTIFIER___Interface) {
        self.view = view
    }
    
    // MARK: - -
    
    static func showView(in <#window,navigation,etc#>: <#type#>) {
        let vc = ___FILEBASENAMEASIDENTIFIER___ViewController()
        let presenter = ___FILEBASENAMEASIDENTIFIER___Presenter(with: vc)
        vc.presenter = presenter
        presenter.show()
    }
    
    func show(in <#window,navigation,etc#>: <#type#>) {
        
    }
    
}

// MARK: - ___FILEBASENAMEASIDENTIFIER___Output -

extension ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___Output {


}
