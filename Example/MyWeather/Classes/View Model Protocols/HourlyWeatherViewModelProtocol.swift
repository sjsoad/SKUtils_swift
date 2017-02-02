//
//  HourlyWeatherViewModelProtocol.swift
//  MyWeather
//
//  Created by Mac on 30.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol HourlyWeatherViewModelProtocol: BaseWeatherViewModelProtocol {
	
	typealias ModelType = HourlyWeatherModel
    
    var temperature: String? { get }
    var apparentTemperature: String? { get }
}

extension HourlyWeatherViewModelProtocol {

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
