//
//  WeatherModel.swift
//  MyWeather
//
//  Created by Mac on 05.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import ObjectMapper

class WeatherModel: NSObject, Mappable {

    var currentWeather: CurrentWeatherModel?
    var hourlyWeather: [HourlyWeatherModel]?
    var dailyWeather: [DailyWeatherModel]?
    
    required init(map: Map) {
        currentWeather = try? map.value("currently")
        hourlyWeather = try? map.value("hourly.data")
        dailyWeather = try? map.value("daily.data")
    }
    
    func mapping(map: Map) {
        currentWeather >>> map["currently"]
        hourlyWeather >>> map["hourly.data"]
        dailyWeather >>> map["daily.data"]
    }
    
}
