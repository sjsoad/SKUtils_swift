//
//  POIResponse.swift
//  LocationWithAR
//
//  Created by Sergey on 28.02.2018.
//Copyright © 2018 Sergey. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

class POIResponse: APIResponsing {
    
    var result: POIResponseType?
    
    required init(JSON: AnyObject) {
        guard let json = JSON as? [String: Any],
            let results = json["results"] as? [[String: Any]] else { return }
        let places = Mapper<PlaceAnnotation>().mapArray(JSONArray: results)
        let nextPageToken = json["next_page_token"] as? String
        result = POIResponseType(places, nextPageToken)
    }
}
