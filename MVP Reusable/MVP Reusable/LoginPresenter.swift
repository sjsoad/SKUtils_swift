//
//  LoginPresenter.swift
//  MVP Reusable
//
//  Created by Sergey on 17.05.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation
import UIKit

protocol LoginInterface: class, ActivityProtocol {
    
    
}

protocol LoginOutput: RequestExecutingProtocol {
    
}

class LoginPresenter: NSObject, LoginOutput {
    
    private weak var view: LoginInterface?
    
    init(with view: LoginInterface) {
        self.view = view
    }
    
    //MARK -
    
    static func showView() {
        let vc = LoginViewController()
        let presenter = LoginPresenter(with: vc)
        vc.presenter = presenter
        //navigation
    }
    
    //MARK: - Activity Protocol
    
    func activityView() -> ActivityProtocol? {
        return view
    }
    
}
