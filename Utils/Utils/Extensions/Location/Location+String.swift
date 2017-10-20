//
//  Location+String.swift
//  Place
//
//  Created by Sergey on 08.09.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocation {

    func stringRepresentation() -> String {
        let latitude = Double(coordinate.latitude)
        let longitude = Double(coordinate.longitude)
        var latSeconds = Int(latitude * 3600)
        let latDegrees = latSeconds / 3600
        latSeconds = abs(latSeconds % 3600)
        let latMinutes = latSeconds / 60
        latSeconds %= 60
        var longSeconds = Int(longitude * 3600)
        let longDegrees = longSeconds / 3600
        longSeconds = abs(longSeconds % 3600)
        let longMinutes = longSeconds / 60
        longSeconds %= 60
        return String(format:"%@%d°%d'%d\" %@%d°%d'%d\"",
                      latDegrees >= 0 ? "N" : "S",
                      abs(latDegrees),
                      latMinutes,
                      latSeconds,
                      longDegrees >= 0 ? "E" : "W",
                      abs(longDegrees),
                      longMinutes,
                      longSeconds) // example: "S22°54'48" W43°12'2""
    
    }

}
