//
//  HourlyWeatherViewModel.swift
//  MyWeather
//
//  Created by Mac on 30.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

class HourlyWeatherViewModel: NSObject, HourlyWeatherViewModelProtocol {

    //MARK: - Properties
    
    var model: HourlyWeatherModel
    
    //MARK: - Functions
    
    init(hourlyModel: HourlyWeatherModel) {
        model = hourlyModel
    }
    
}
