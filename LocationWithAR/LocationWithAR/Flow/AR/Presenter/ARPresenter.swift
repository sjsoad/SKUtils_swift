//
//  ARPresenter.swift
//  LocationWithAR
//
//  Created by Sergey on 12.03.2018.
//Copyright © 2018 Sergey. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol ARInterface: class, ActivityViewable, AlertViewable {
    
    func add(places: [PlaceAnnotation])
    
}

protocol AROutput {
    
    var currentLocation: CLLocation? { get }
    
    func viewDidLoad()
    
}

class ARPresenter: NSObject, RequestExecuting, RequestErrorHandling, POIRequesting {
    
    private weak var view: ARInterface?
    
    private lazy var locationPermissions: LocationPermissions = { [weak self] in
        let alertTitles = AlertTitles(title: "Warning",
                                      message: "Need to enable location service",
                                      actionButtonTitle: "Ok",
                                      cancelButtonTitle: "Cancel")
        let permissions = LocationPermissions(settingAlertTitles: alertTitles)
        return permissions
        }()
    private lazy var locationManager: CLLocationManager = { [weak self] in
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        return locationManager
        }()
    
    init(with view: ARInterface) {
        self.view = view
    }
    
    // MARK: - -
    
    static func showView(in window: UIWindow?) {
        let vc = ARViewController()
        let presenter = ARPresenter(with: vc)
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
    
    // MARK: - Private -
    
    private func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
}

// MARK: - ARPresenterOutput -

extension ARPresenter: AROutput {

    var currentLocation: CLLocation? {
        return locationManager.location
    }
    
    func viewDidLoad() {
        let currentState: CLAuthorizationStatus = locationPermissions.permissionsState()
        guard currentState != .authorizedAlways || currentState != .authorizedWhenInUse else { return }
        locationPermissions.requestPermissions { [weak self] (state) in
            if state == .denied {
                self?.locationPermissions.showSettingsAlert()
            }
            if state == .authorizedAlways || state == .authorizedWhenInUse {
                self?.startUpdatingLocation()
            }
        }
    }

}

// MARK: - CLLocationManagerDelegate -

extension ARPresenter: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty, let location = locations.first else { return }
        poi(for: location.coordinate, in: 100, pageToken: nil, successHandler: { [weak self] (response) in
            guard let result = response.result else { return }
            self?.view?.add(places: result.places)
            }, executingHandler: requestExecutingHandler(), errorHandler: requestErrorHandler())
        locationManager.stopUpdatingLocation()
    }
    
}
