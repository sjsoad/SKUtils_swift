//
//  CurrentWeatherViewModel.swift
//  MyWeather
//
//  Created by Mac on 30.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

class CurrentWeatherViewModel: NSObject, CurrentWeatherViewModelProtocol {
    
    //MARK: - Properties
    
    var model: CurrentWeatherModel
    
    //MARK: - Functions
    
    init(currentModel: CurrentWeatherModel) {
        model = currentModel
    }
    
}
