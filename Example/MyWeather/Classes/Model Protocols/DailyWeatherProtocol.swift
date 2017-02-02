//
//  DailyweatherProtocol.swift
//  MyWeather
//
//  Created by Mac on 30.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol DailyWeatherProtocol {
    
    var sunriseTime: Double? { get set }
    var sunsetTime: Double? { get set }
    var moonPhase: Double? { get set }
    var precipIntensityMax: Double? { get set }
    var precipIntensityMaxTime: Double? { get set }
    var precipType: String? { get set }
    var temperatureMin: Double? { get set }
    var temperatureMinTime: Double? { get set }
    var temperatureMax: Double? { get set }
    var temperatureMaxTime: Double? { get set }
    var apparentTemperatureMin: Double? { get set }
    var apparentTemperatureMinTime: Double? { get set }
    var apparentTemperatureMax: Double? { get set }
    var apparentTemperatureMaxTime: Double? { get set }
    
}
