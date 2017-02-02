//
//  CurrentWeatherViewModelProtocol.swift
//  MyWeather
//
//  Created by Mac on 30.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol CurrentWeatherViewModelProtocol: BaseWeatherViewModelProtocol {
	
	typealias ModelType = CurrentWeatherModel
	
    var nearestStormDistance: String? { get }
    var nearestStormBearing: String? { get }
    var temperature: String? { get }
    var apparentTemperature: String? { get }
}

extension CurrentWeatherViewModelProtocol {
    
    var nearestStormDistance: String? {
        return Converter.stringOrNil(value: model.nearestStormDistance)
    }
    var nearestStormBearing: String? {
        return Converter.stringOrNil(value: model.nearestStormBearing)
    }
    var temperature: String? {
        if let temperature = Converter.stringOrNil(value: model.temperature,
                                                   format: "%.1f") {
            return temperature + "°"
        }
        return nil
    }
    var apparentTemperature: String? {
        return Converter.stringOrNil(value: model.apparentTemperature)
    }
    
}
