//
//  СurrentPlaceViewModel.swift
//  MyWeather
//
//  Created by Mac on 21.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import GooglePlaces

class CurrentPlaceViewModel: NSObject {

    var currentPlace: GMSPlace
    
    init(withPlace place: GMSPlace) {
        currentPlace = place
    }
 
    func name() -> String? {
        return currentPlace.name
    }
    
    func coordinate() -> CLLocationCoordinate2D {
        return currentPlace.coordinate
    }
    
}
