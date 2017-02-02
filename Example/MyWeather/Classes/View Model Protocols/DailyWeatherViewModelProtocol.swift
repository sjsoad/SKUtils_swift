//
//  DailyWeatherViewModelProtocol.swift
//  MyWeather
//
//  Created by Mac on 30.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import AFDateHelper

protocol DailyWeatherViewModelProtocol: BaseWeatherViewModelProtocol {
	
	typealias ModelType = DailyWeatherModel
    
    var temperatureRange: String? { get }
    var sunriseTime: String? { get }
    var sunsetTime: String? { get }
    var moonPhase: String? { get }
    var precipIntensityMax: String? { get }
    var precipIntensityMaxTime: String? { get }
    var precipType: String? { get }
    var temperatureMin: String? { get }
    var temperatureMinTime: String? { get }
    var temperatureMax: String? { get }
    var temperatureMaxTime: String? { get }
    var apparentTemperatureMin: String? { get }
    var apparentTemperatureMinTime: String? { get }
    var apparentTemperatureMax: String? { get }
    var apparentTemperatureMaxTime: String? { get }
    
}

extension DailyWeatherViewModelProtocol {
    
    var temperatureRange: String? {
        if let min = temperatureMin, let max = temperatureMax {
            return min + "°" + "..." + max + "°"
        }
        return nil
    }
    var sunriseTime: String? {
        return Converter.stringOrNil(value: model.sunriseTime)
    }
    var sunsetTime: String? {
        return Converter.stringOrNil(value: model.sunsetTime)
    }
    var moonPhase: String? {
        return Converter.stringOrNil(value: model.moonPhase)
    }
    var precipIntensityMax: String? {
        return Converter.stringOrNil(value: model.precipIntensityMax)
    }
    var precipIntensityMaxTime: String? {
        return Converter.stringOrNil(value: model.precipIntensityMaxTime)
    }
    var precipType: String? {
        return model.precipType
    }
    var temperatureMin: String? {
        return Converter.stringOrNil(value: model.temperatureMin,
                                     format: "%.1f")
    }
    var temperatureMinTime: String? {
        return Converter.stringOrNil(value: model.temperatureMinTime)
    }
    var temperatureMax: String? {
        return Converter.stringOrNil(value: model.temperatureMax,
                                     format: "%.1f")
    }
    var temperatureMaxTime: String? {
        return Converter.stringOrNil(value: model.temperatureMaxTime)
    }
    var apparentTemperatureMin: String? {
        return Converter.stringOrNil(value: model.apparentTemperatureMin)
    }
    var apparentTemperatureMinTime: String? {
        return Converter.stringOrNil(value: model.apparentTemperatureMinTime)
    }
    var apparentTemperatureMax: String? {
        return Converter.stringOrNil(value: model.apparentTemperatureMax)
    }
    var apparentTemperatureMaxTime: String? {
        return Converter.stringOrNil(value: model.apparentTemperatureMaxTime)
    }
    
}
