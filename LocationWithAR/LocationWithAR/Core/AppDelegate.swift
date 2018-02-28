//
//  AppDelegate.swift
//  LocationWithAR
//
//  Created by Sergey on 28.02.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        startApplication()
        return true
    }

    // MARK: - Private -
    
    func startApplication() {
        window = UIWindow(frame: UIScreen.main.bounds)
        MapPresenter.showView(in: window)
    }
    
}
