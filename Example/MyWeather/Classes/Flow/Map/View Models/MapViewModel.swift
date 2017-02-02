//
//  MapViewModel.swift
//  MyWeather
//
//  Created by Mac on 13.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewModel: NSObject {
    
    func locationMarker(forPlace place: GMSPlace) -> GMSMarker {
        let marker = GMSMarker(position: place.coordinate)
        if let mapCurrentWeatherView = MapCurrentWeatherView.loadNib() as? MapCurrentWeatherView {
            mapCurrentWeatherView.currentPlaceVM = CurrentPlaceViewModel(withPlace: place)
            marker.iconView = mapCurrentWeatherView
        }
        return marker
    }
    
    func place(forPlaceId placeID: String?,
               completion: ((GMSPlace) -> Swift.Void)? = nil) {
        if let place = placeID {
            GMSPlacesClient.shared().lookUpPlaceID(place, callback: { (place, error) in
                if let err = error {
                    print(err.localizedDescription)
                }
                else if let handler = completion, let gmPlace = place {
                    handler(gmPlace)
                }
            })
        }
    }
}
