//
//  CurrentWeatherResponse.swift
//  MyWeather
//
//  Created by Mac on 21.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import ObjectMapper

class CurrentWeatherResponse: ResponseProtocol {

    var currentWeatherModel: CurrentWeatherModel?
    
    required init(JSON: AnyObject) {
        if let json = JSON as? [String: AnyObject] {
            if let currently = json["currently"] as? [String: AnyObject] {
                currentWeatherModel = Mapper<CurrentWeatherModel>().map(JSON: currently)
            }
        }
    }
    
}
