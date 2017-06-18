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

    static func navigateToMapObject(marker: GMSMarker) {
        if UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!) {
            let url = String(format: "comgooglemaps://?daddr=%f,%f&directionsmode=driving",
                             marker.position.latitude,
                             marker.position.longitude)
            
            UIApplication.shared.openURL(URL(string: url)!)
        } else {
            let url = String(format: "http://maps.apple.com/maps?daddr=%.6f,%.6f",
                             marker.position.latitude,
                             marker.position.longitude)
            UIApplication.shared.openURL(URL(string: url)!)
        }
    }
    
}
