//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import UIKit

protocol ___FILEBASENAMEASIDENTIFIER___Interface: class, ActivityViewable {
    
}

protocol ___FILEBASENAMEASIDENTIFIER___Output: RequestExecuting {
    
}

class ___FILEBASENAMEASIDENTIFIER___Presenter: NSObject, ___FILEBASENAMEASIDENTIFIER___Output {
    
    private weak var view: ___FILEBASENAMEASIDENTIFIER___Interface?
    
    init(with view: ___FILEBASENAMEASIDENTIFIER___Interface) {
        self.view = view
    }
    
    // MARK - -
    
    static func showView(in <#window,navigation,etc#>: <#type#>) {
        let vc = ___FILEBASENAMEASIDENTIFIER___ViewController()
        let presenter = ___FILEBASENAMEASIDENTIFIER___Presenter(with: vc)
        vc.presenter = presenter
        //navigation
    }
    
    // MARK: - Activity Protocol -
    
    func activityView() -> ActivityViewable? {
        return view
    }
    
}
