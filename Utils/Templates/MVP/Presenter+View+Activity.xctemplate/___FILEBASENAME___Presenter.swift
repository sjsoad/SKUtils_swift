//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import UIKit

protocol ___VARIABLE_fileName:identifier___Interface: class, ActivityViewable {
    
}

protocol ___VARIABLE_fileName:identifier___Output {
    
}

class ___FILEBASENAMEASIDENTIFIER___: NSObject, RequestExecuting {
    
    private weak var view: ___VARIABLE_fileName:identifier___Interface?
    
    init(with view: ___VARIABLE_fileName:identifier___Interface) {
        self.view = view
    }
    
    // MARK - -
    
    static func showView(in <#window,navigation,etc#>: <#type#>) {
        let vc = ___VARIABLE_fileName:identifier___ViewController()
        let presenter = ___VARIABLE_fileName:identifier___Presenter(with: vc)
        vc.presenter = presenter
        //navigation
    }
    
    // MARK: - Activity Protocol -
    
    func activityView() -> ActivityViewable? {
        return view
    }
    
}

// MARK: - ___VARIABLE_fileName:identifier___Output -

extension ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_fileName:identifier___Output {
    
    
}
