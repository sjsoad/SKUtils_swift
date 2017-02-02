//
//  WeatherModelProtocol.swift
//  MyWeather
//
//  Created by Mac on 30.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol HourlyWeatherProtocol {
    
    var temperature: Double? { get set }
    var apparentTemperature: Double? { get set }
    
}
