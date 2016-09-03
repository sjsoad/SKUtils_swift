//
//  SKLocationService.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 03.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import CoreLocation

class SKLocationService: NSObject, CLLocationManagerDelegate {
    
    static let sharedInstance = SKLocationService()
    
    var settingsAlertTitle: String?
    var settingsAlertMessage: String?
    var alertSettingsButtonTitle: String?
    var alertCancelButtonTitle: String?
    
    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    //MARK: - Public methods
    
    func startLocationService() {
        self.checkLocationServiceState()
    }
    
    func currentLocation() -> CLLocationCoordinate2D? {
        return locationManager.location?.coordinate
    }
    
    //MARK: - Private methods
    
    private func checkLocationServiceState() {
        switch CLLocationManager.authorizationStatus() {
        case .NotDetermined:
            if locationManager.respondsToSelector(#selector(CLLocationManager.requestAlwaysAuthorization)) {
                locationManager.requestAlwaysAuthorization()
            }
            locationManager.startUpdatingLocation()
            break
        case .Restricted, .Denied, .AuthorizedWhenInUse:
            self.showSettingsAlert()
            break
            
        default:
            print("default")
        }
    }
    
    private func showSettingsAlert() {
        let alert = UIAlertController.init(title: settingsAlertTitle,
                                           message: settingsAlertMessage,
                                           preferredStyle: .Alert)
        let settingsAction = UIAlertAction.init(title: alertSettingsButtonTitle,
                                                style: .Default) { (action) in
                                                    self.openSettings()
        }
        let cancelAction = UIAlertAction.init(title: alertCancelButtonTitle,
                                              style: .Cancel,
                                              handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        if let topView = UIApplication.sharedApplication().keyWindow?.rootViewController {
            topView.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    private func openSettings() {
        let settingsURL = NSURL.init(string: UIApplicationOpenSettingsURLString)
        if UIApplication.sharedApplication().canOpenURL(settingsURL!) {
            UIApplication.sharedApplication().openURL(settingsURL!)
        }
    }
    
    //MARK: - CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager,
                         didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        
    }
}