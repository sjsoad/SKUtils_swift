//
//  WeatherViewModel.swift
//  MyWeather
//
//  Created by Mac on 29.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

class DailyWeatherViewModel: NSObject, DailyWeatherViewModelProtocol {

    //MARK: - Properties
    
    var model: DailyWeatherModel
    
    //MARK: - Functions
    
    init(dailyModel: DailyWeatherModel) {
        model = dailyModel
    }
    
}
