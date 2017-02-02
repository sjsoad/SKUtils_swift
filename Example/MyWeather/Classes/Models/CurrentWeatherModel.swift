//
//  CurrentWeatherModel.swift
//  MyWeather
//
//  Created by Mac on 30.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import ObjectMapper

class CurrentWeatherModel: NSObject, BaseWeatherProtocol, CurrentWeatherProtocol, HourlyWeatherProtocol, Mappable {
 
    var time: Double?
    var summary: String?
    var icon: String?
    var precipIntensity: Double?
    var precipProbability: Double?
    var temperature: Double?
    var dewPoint: Double?
    var humidity: Double?
    var windSpeed: Double?
    var windBearing: Double?
    var visibility: Double?
    var cloudCover: Double?
    var pressure: Double?
    var ozone: Double?
    var nearestStormDistance: Double?
    var nearestStormBearing: Double?
    var apparentTemperature: Double?
    
    override init() {
        
    }
    
    required init(map: Map) {
        time = try? map.value("time")
        summary = try? map.value("summary")
        icon = try? map.value("icon")
        precipIntensity = try? map.value("precipIntensity")
        precipProbability = try? map.value("precipProbability")
        temperature = try? map.value("temperature")
        dewPoint = try? map.value("dewPoint")
        humidity = try? map.value("humidity")
        windSpeed = try? map.value("windSpeed")
        windBearing = try? map.value("windBearing")
        visibility = try? map.value("visibility")
        cloudCover = try? map.value("cloudCover")
        pressure = try? map.value("pressure")
        ozone = try? map.value("ozone")
        nearestStormDistance = try? map.value("nearestStormDistance")
        nearestStormBearing = try? map.value("nearestStormBearing")
        apparentTemperature = try? map.value("apparentTemperature")
    }
    
    func mapping(map: Map) {
        time >>> map["time"]
        summary >>> map["summary"]
        icon >>> map["icon"]
        precipIntensity >>> map["precipIntensity"]
        precipProbability >>> map["precipProbability"]
        temperature >>> map["temperature"]
        dewPoint >>> map["dewPoint"]
        humidity >>> map["humidity"]
        windSpeed >>> map["windSpeed"]
        windBearing >>> map["windBearing"]
        visibility >>> map["visibility"]
        cloudCover >>> map["cloudCover"]
        pressure >>> map["pressure"]
        ozone >>> map["ozone"]
        nearestStormDistance >>> map["nearestStormDistance"]
        nearestStormBearing >>> map["nearestStormBearing"]
        apparentTemperature >>> map["apparentTemperature"]
    }
}
