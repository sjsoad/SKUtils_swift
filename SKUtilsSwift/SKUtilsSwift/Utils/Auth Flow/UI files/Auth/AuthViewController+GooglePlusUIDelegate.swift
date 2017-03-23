//
//  File.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import GoogleSignIn

extension AuthViewController: GIDSignInUIDelegate {
    
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
