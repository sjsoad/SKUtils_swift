//
//  CurrentWeatherProtocol.swift
//  MyWeather
//
//  Created by Mac on 30.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol CurrentWeatherProtocol {
    
    var nearestStormDistance: Double? { get set }
    var nearestStormBearing: Double? { get set }
    
}
