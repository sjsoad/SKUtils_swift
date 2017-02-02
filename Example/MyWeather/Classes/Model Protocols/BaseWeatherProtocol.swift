//
//  BaseWeatherProtocol.swift
//  MyWeather
//
//  Created by Mac on 30.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol BaseWeatherProtocol {
    
    var time: Double? { get set }
    var summary: String? { get set }
    var icon: String? { get set }
    var precipIntensity: Double? { get set }
    var precipProbability: Double? { get set }
    var dewPoint: Double? { get set }
    var humidity: Double? { get set }
    var windSpeed: Double? { get set }
    var windBearing: Double? { get set }
    var visibility: Double? { get set }
    var cloudCover: Double? { get set }
    var pressure: Double? { get set }
    var ozone: Double? { get set }
    
}
