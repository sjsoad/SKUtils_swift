//
//  MapsHelper.swift
//  GeoTouch
//
//  Created by Sergey on 06.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import GoogleMaps

class MapsHelper: NSObject {

    static func navigateToMapObject(marker: GMSMarker, completionHandler: ((Bool) -> Void)?) {
        if isGoogleMapsAvailable() {
            openInGoogleMaps(marker: marker, completionHandler: completionHandler)
        } else {
            openInNativeMaps(marker: marker, completionHandler: completionHandler)
        }
    }
    
    static func isGoogleMapsAvailable() -> Bool {
        guard let googleMapsURL = URL(string: "comgooglemaps://") else { return false }
        return UIApplication.shared.canOpenURL(googleMapsURL)
    }
    
    private static func openInGoogleMaps(marker: GMSMarker, completionHandler: ((Bool) -> Void)?) {
        let urlString = String(format: "comgooglemaps://?daddr=%f,%f&directionsmode=driving",
                         marker.position.latitude,
                         marker.position.longitude)
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: completionHandler)
    }

    private static func openInNativeMaps(marker: GMSMarker, completionHandler: ((Bool) -> Void)?) {
        let urlString = String(format: "http://maps.apple.com/maps?daddr=%.6f,%.6f",
                         marker.position.latitude,
                         marker.position.longitude)
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: completionHandler)
    }
    
}
