//
//  LoginPresenter.swift
//  AuthFlow
//
//  Created by Sergey on 17.05.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation
import UIKit

protocol LoginInterface: class {
    
}

protocol LoginOutput {
    
}

class LoginPresenter: LoginOutput {
    
    private weak var view: LoginInterface?
    
    init(with view: LoginInterface) {
        self.view = view
    }
    
    //MARK -
    
    static func showView(in <#window,navigation,etc#>: <#type#>) {
        let vc = LoginViewController()
        let presenter = LoginPresenter(with: vc)
        vc.presenter = presenter
        //navigation
    }
    
}
