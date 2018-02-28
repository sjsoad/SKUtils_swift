//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import UIKit

protocol ___VARIABLE_fileName:identifier___Interface: class, ActivityViewable, AlertViewable {
    
}

protocol ___VARIABLE_fileName:identifier___Output {
    
}

class ___FILEBASENAMEASIDENTIFIER___: NSObject, RequestExecuting, RequestErrorHandling {
    
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
    
    // MARK: - ActivityViewable -
    
    func activityView() -> ActivityViewable? {
        return view
    }

    // MARK: - AlertViewable -
    
    func alertView() -> AlertViewable? {
        return view
    }
    
}

// MARK: - ___VARIABLE_fileName:identifier___Output -

extension ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_fileName:identifier___Output {
    
    
}
