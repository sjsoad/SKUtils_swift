//
//  WeatherViewModel.swift
//  MyWeather
//
//  Created by Mac on 05.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

class WeatherViewModel: NSObject {

    //MARK: - Properties
    
    var weatherModel: WeatherModel?
    var updateUI: Dynamic<Bool> = Dynamic(false)
    var errorMessage: Dynamic<String> = Dynamic("")
    
    //MARK: - Functions
    
    func weatherRequest() {
//        let weatherReuest = WeatherRequest()
//        let apiClient = SKUtils.delegate().apiClient
//        _ = apiClient.executeRequest(request: weatherReuest,
//                                     success: { response in
//                                        self.weatherModel = response.weatherModel
//                                        self.updateUI.value = true
//        },
//                                     failure: { error in
//                                        self.errorMessage.value = error.localizedDescription
//        })
    }
    
    func currentWeatherVM() -> CurrentWeatherViewModel? {
        if let weather = weatherModel {
            if let currentWeather = weather.currentWeather {
                let currentWeatherVM = CurrentWeatherViewModel(currentModel: currentWeather)
                return currentWeatherVM
            }
        }
        return nil
    }
    
    func hourlyWeatherForecastVM() -> HourlyWeatherForecastViewModel? {
        if let weather = weatherModel {
            if let hourlyForecast = weather.hourlyWeather {
                let hourlyWeatherForecastVM = HourlyWeatherForecastViewModel(array: hourlyForecast)
                return hourlyWeatherForecastVM
            }
        }
        return nil
    }
    
    func dailyWeatherForecastVM() -> DailyWeatherForecastViewModel? {
        if let weather = weatherModel {
            if let dailyForecast = weather.dailyWeather {
                let dailyWeatherForecastVM = DailyWeatherForecastViewModel(array: dailyForecast)
                return dailyWeatherForecastVM
            }
        }
        return nil
    }
    
}
