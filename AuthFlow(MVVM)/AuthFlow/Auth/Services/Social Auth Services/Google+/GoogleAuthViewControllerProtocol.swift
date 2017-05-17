//
//  GoogleAuthViewControllerProtocol.swift
//  StudentShare
//
//  Created by Sergey on 24.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import GoogleSignIn

//MARK: - Maybe it's not using

@objc protocol GoogleAuthViewControllerProtocol: GIDSignInUIDelegate {

}

extension GoogleAuthViewControllerProtocol where Self: UIViewController {

    //MARK: - GIDSignInUIDelegate
    
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController,
                     animated: true,
                     completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true,
                     completion: nil)
    }
    
}
