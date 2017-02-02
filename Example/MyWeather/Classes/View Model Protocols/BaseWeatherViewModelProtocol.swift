//
//  BaseWeatherViewModelProtocol.swift
//  MyWeather
//
//  Created by Mac on 30.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

protocol BaseWeatherViewModelProtocol {
	
	associatedtype ModelType: BaseWeatherProtocol
	
	var model: ModelType { get set }
	
    var date: String? { get }
	var time: String? { get }
	var summary: String? { get }
	var icon: UIImage? { get }
	var precipIntensity: String? { get }
	var precipProbability: String? { get }
	var dewPoint: String? { get }
	var humidity: String? { get }
	var windSpeed: String? { get }
	var windBearing: String? { get }
	var visibility: String? { get }
	var cloudCover: String? { get }
	var pressure: String? { get }
	var ozone: String? { get }
	
}

extension BaseWeatherViewModelProtocol {
	
    var date: String? {
        if let time = model.time {
            let date = Date(timeIntervalSince1970: time)
            return date.toString(.custom("EEEE, d"))
        }
        return nil
    }
    var time: String? {
        if let time = model.time {
            let date = Date(timeIntervalSince1970: time)
            return date.toString(.custom("HH:mm"))
        }
        return nil
    }
    var summary: String? {
        return model.summary
    }
    var icon: UIImage? {
        if let iconName = model.icon {
            return UIImage(named: iconName)
        }
        return nil
    }
	var precipIntensity: String? {
        return Converter.stringOrNil(value: model.precipIntensity)
	}
	var precipProbability: String? {
        return Converter.stringOrNil(value: model.precipProbability)
	}
	var dewPoint: String? {
        return Converter.stringOrNil(value: model.dewPoint)
	}
	var humidity: String? {
        if var humidity = model.humidity {
            humidity = humidity * 100
            return Converter.stringOrEmpty(value: humidity,
                                           format: "%.0f") + "%"
        }
        return nil
	}
	var windSpeed: String? {
        return Converter.stringOrNil(value: model.windSpeed)
	}
	var windBearing: String? {
        return Converter.stringOrNil(value: model.windBearing)
	}
	var visibility: String? {
        return Converter.stringOrNil(value: model.visibility)
	}
	var cloudCover: String? {
        return Converter.stringOrNil(value: model.cloudCover)
	}
	var pressure: String? {
        return Converter.stringOrNil(value: model.pressure)
	}
	var ozone: String? {
        return Converter.stringOrNil(value: model.ozone)
	}
    
}
