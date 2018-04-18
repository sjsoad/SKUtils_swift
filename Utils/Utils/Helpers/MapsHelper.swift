//
//  MapsHelper.swift
//  GeoTouch
//
//  Created by Sergey on 06.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import CoreLocation

class MapsHelper: NSObject {

    static func navigate(to coordinates: CLLocationCoordinate2D, completionHandler: ((Bool) -> Void)?) {
        guard isGoogleMapsAvailable() else {
            openInNativeMaps(for: coordinates, completionHandler: completionHandler)
            return
        }
        openInGoogleMaps(for: coordinates, completionHandler: completionHandler)
    }
    
    static func isGoogleMapsAvailable() -> Bool {
        guard let googleMapsURL = URL(string: "comgooglemaps://") else { return false }
        return app().canOpenURL(googleMapsURL)
    }
    
    // MARK: - Private -
    
    private static func app() -> UIApplication {
        return UIApplication.shared
    }
    
    private static func openInGoogleMaps(for coordinates: CLLocationCoordinate2D, completionHandler: ((Bool) -> Void)?) {
        let urlString = String(format: "comgooglemaps://?daddr=%f,%f&directionsmode=driving", coordinates.latitude, coordinates.longitude)
        guard let url = URL(string: urlString), app().canOpenURL(url) else {
            completionHandler?(false)
            return }
        app().open(url, options: [:], completionHandler: completionHandler)
    }

    private static func openInNativeMaps(for coordinates: CLLocationCoordinate2D, completionHandler: ((Bool) -> Void)?) {
        let urlString = String(format: "http://maps.apple.com/maps?daddr=%.6f,%.6f", coordinates.latitude, coordinates.longitude)
        guard let url = URL(string: urlString), app().canOpenURL(url) else {
            completionHandler?(false)
            return }
        app().open(url, options: [:], completionHandler: completionHandler)
    }
    
}
