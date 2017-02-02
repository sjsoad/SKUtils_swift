//
//  WeatherModel.swift
//  MyWeather
//
//  Created by Mac on 29.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import ObjectMapper

class DailyWeatherModel: NSObject, BaseWeatherProtocol, DailyWeatherProtocol, Mappable {
    
    var time: Double?
    var summary: String?
    var icon: String?
    var precipIntensity: Double?
    var precipProbability: Double?
    var dewPoint: Double?
    var humidity: Double?
    var windSpeed: Double?
    var windBearing: Double?
    var visibility: Double?
    var cloudCover: Double?
    var pressure: Double?
    var ozone: Double?
    var sunriseTime: Double?
    var sunsetTime: Double?
    var moonPhase: Double?
    var precipIntensityMax: Double?
    var precipIntensityMaxTime: Double?
    var precipType: String?
    var temperatureMin: Double?
    var temperatureMinTime: Double?
    var temperatureMax: Double?
    var temperatureMaxTime: Double?
    var apparentTemperatureMin: Double?
    var apparentTemperatureMinTime: Double?
    var apparentTemperatureMax: Double?
    var apparentTemperatureMaxTime: Double?

    override init() {
        
    }
    
    required init(map: Map) {
        time = try? map.value("time")
        summary = try? map.value("summary")
        icon = try? map.value("icon")
        precipIntensity = try? map.value("precipIntensity")
        precipProbability = try? map.value("precipProbability")
        dewPoint = try? map.value("dewPoint")
        humidity = try? map.value("humidity")
        windSpeed = try? map.value("windSpeed")
        windBearing = try? map.value("windBearing")
        visibility = try? map.value("visibility")
        cloudCover = try? map.value("cloudCover")
        pressure = try? map.value("pressure")
        ozone = try? map.value("ozone")
        sunriseTime = try? map.value("sunriseTime")
        sunsetTime = try? map.value("sunsetTime")
        moonPhase = try? map.value("moonPhase")
        precipIntensityMax = try? map.value("precipIntensityMax")
        precipIntensityMaxTime = try? map.value("precipIntensityMaxTime")
        precipType = try? map.value("precipType")
        temperatureMin = try? map.value("temperatureMin")
        temperatureMinTime = try? map.value("temperatureMinTime")
        temperatureMax = try? map.value("temperatureMax")
        temperatureMaxTime = try? map.value("temperatureMaxTime")
        apparentTemperatureMin = try? map.value("apparentTemperatureMin")
        apparentTemperatureMinTime = try? map.value("apparentTemperatureMinTime")
        apparentTemperatureMax = try? map.value("apparentTemperatureMax")
        apparentTemperatureMaxTime = try? map.value("apparentTemperatureMaxTime")
    }
    
    func mapping(map: Map) {
        time >>> map["time"]
        summary >>> map["summary"]
        icon >>> map["icon"]
        precipIntensity >>> map["precipIntensity"]
        precipProbability >>> map["precipProbability"]
        dewPoint >>> map["dewPoint"]
        humidity >>> map["humidity"]
        windSpeed >>> map["windSpeed"]
        windBearing >>> map["windBearing"]
        visibility >>> map["visibility"]
        cloudCover >>> map["cloudCover"]
        pressure >>> map["pressure"]
        ozone >>> map["ozone"]
        sunriseTime >>> map["sunriseTime"]
        sunsetTime >>> map["sunsetTime"]
        moonPhase >>> map["moonPhase"]
        precipIntensityMax >>> map["precipIntensityMax"]
        precipIntensityMaxTime >>> map["precipIntensityMaxTime"]
        precipType >>> map["precipType"]
        temperatureMin >>> map["temperatureMin"]
        temperatureMinTime >>> map["temperatureMinTime"]
        temperatureMax >>> map["temperatureMax"]
        temperatureMaxTime >>> map["temperatureMaxTime"]
        apparentTemperatureMin >>> map["apparentTemperatureMin"]
        apparentTemperatureMinTime >>> map["apparentTemperatureMinTime"]
        apparentTemperatureMax >>> map["apparentTemperatureMax"]
        apparentTemperatureMaxTime >>> map["apparentTemperatureMaxTime"]
    }
    
}

