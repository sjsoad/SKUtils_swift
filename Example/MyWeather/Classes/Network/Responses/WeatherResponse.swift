//
//  WeatherResponse.swift
//  MyWeather
//
//  Created by Mac on 05.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import ObjectMapper

class WeatherResponse: ResponseProtocol {
    
    var weatherModel: WeatherModel?
    
    required init(JSON: AnyObject) {
        if let json = JSON as? [String: AnyObject] {
            weatherModel = Mapper<WeatherModel>().map(JSON: json)
        }
    }
    
}
