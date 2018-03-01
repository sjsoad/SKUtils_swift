//
//  PlaceAnnotation.swift
//  LocationWithAR
//
//  Created by Sergey on 28.02.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit
import MapKit
import ObjectMapper

class PlaceAnnotation: NSObject, Mappable, MKAnnotation {

    private(set) var coordinate: CLLocationCoordinate2D
    private(set) var title: String?
    
    init(location: CLLocationCoordinate2D, title: String) {
        self.coordinate = location
        self.title = title
    }
    
    // MARK: - Mappable -
    
    required init?(map: Map) {
        self.coordinate = CLLocationCoordinate2DMake(0, 0)
    }
    
    func mapping(map: Map) {
        coordinate <- (map["geometry.location"], PlaceAnnotation.locationTransform())
        title <- map["name"]
    }
    
    class func locationTransform() -> TransformOf<CLLocationCoordinate2D, [String: Any]> {
        let transform = TransformOf(fromJSON: { (value: [String: Any]?) -> CLLocationCoordinate2D? in
            guard let lat = value?["lat"] as? Double,
                let lon = value?["lng"] as? Double else { return nil }
            return CLLocationCoordinate2DMake(lat, lon)
        }, toJSON: { (coordinate: CLLocationCoordinate2D?) -> [String: Any]? in
            guard let coordinate = coordinate else { return nil }
            return ["lat": coordinate.latitude,
                    "lng": coordinate.longitude]
        })
        return transform
    }
    
}
