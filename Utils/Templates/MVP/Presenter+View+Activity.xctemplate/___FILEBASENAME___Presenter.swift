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
    
    private var servicesRepository: ServicesRepository
    
    init(with view: ___VARIABLE_fileName:identifier___Interface, servicesRepository: ServicesRepository) {
        self.view = view
        self.servicesRepository = servicesRepository
    }
    
    // MARK - -
    
    static func showView(in <#window,navigation,etc#>: <#type#>?, servicesRepository: ServicesRepository) {
        let vc = ___VARIABLE_fileName:identifier___ViewController()
        let presenter = ___VARIABLE_fileName:identifier___Presenter(with: vc, servicesRepository: servicesRepository)
        vc.presenter = presenter
        presenter.show(in: navigationController)
    }
    
    func show(in <#window,navigation,etc#>: <#type#>?) {
        /* #1
         guard let viewController = view as? UIViewController else {
         return
         }
         navigationController?.pushViewController(viewController, animated: true)
         */
        /* #2
         guard let window = window, let viewController = view as? UIViewController else {
         return
         }
         let navigationController = UINavigationController(rootViewController: viewController)
         navigationController.isNavigationBarHidden = true
         UIView.transition(with: window,
         duration: Defaults.transitionDuration,
         options: .transitionCrossDissolve,
         animations: {
         window.rootViewController = navigationController
         window.makeKeyAndVisible()
         }, completion: nil)
         */
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
