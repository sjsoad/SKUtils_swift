//
//  MapPresenter.swift
//  LocationWithAR
//
//  Created by Sergey on 28.02.2018.
//Copyright © 2018 Sergey. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol MapInterface: class, ActivityViewable, AlertViewable {
    
}

protocol MapOutput {
    
    func viewDidLoad()
    
}

class MapPresenter: NSObject, RequestExecuting, RequestErrorHandling {
    
    private weak var view: MapInterface?
    
    private lazy var locationPermissions: LocationPermissions = { [weak self] in
        let alertTitles = AlertTitles(title: "Warning",
                                      message: "Need to enable location service",
                                      actionButtonTitle: "Ok",
                                      cancelButtonTitle: "Cancel")
        let permissions = LocationPermissions(settingAlertTitles: alertTitles)
        return permissions
        }()
    
    init(with view: MapInterface) {
        self.view = view
    }
    
    // MARK - -
    
    static func showView(in window: UIWindow?) {
        let vc = MapViewController()
        let presenter = MapPresenter(with: vc)
        vc.presenter = presenter
        presenter.show(in: window)
    }
    
    func show(in window: UIWindow?) {
        guard let window = window, let viewController = view as? UIViewController else {
            return
        }
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
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

// MARK: - MapOutput -

extension MapPresenter: MapOutput {
    
    func viewDidLoad() {
        let currentState: CLAuthorizationStatus = locationPermissions.permissionsState()
        guard currentState != .authorizedAlways || currentState != .authorizedWhenInUse else { return }
        locationPermissions.requestPermissions { [weak self] (state) in
            if state == .denied {
                self?.locationPermissions.showSettingsAlert()
            }
            if state == .authorizedAlways || state == .authorizedWhenInUse {
                print("go")
            }
        }
    }
    
}
