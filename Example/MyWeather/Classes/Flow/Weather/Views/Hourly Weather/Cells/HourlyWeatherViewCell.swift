//
//  HourlyWeatherViewCell.swift
//  MyWeather
//
//  Created by Mac on 06.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class HourlyWeatherViewCell: WeatherViewCell, ConfigurableCell {

    //MARK: - Properties
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var humidity: UILabel!
    
    //MARK: - Functions
    
    internal func configure<T>(viewModel: T) {
        if let hourlyVM = viewModel as? HourlyWeatherViewModel {
            timeLabel.text = hourlyVM.time
            humidity.text = hourlyVM.humidity
            icon.image = hourlyVM.icon
            temperature.text = hourlyVM.temperature
        }
    }
}
