//
//  DailyWeatherViewCell.swift
//  MyWeather
//
//  Created by Mac on 06.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class DailyWeatherViewCell: WeatherViewCell, ConfigurableCell {

    //MARK: - Properties

    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK: - Functions
    
    internal func configure<T>(viewModel: T) {
        if let dailyVM = viewModel as? DailyWeatherViewModel {
            dateLabel.text = dailyVM.date
            icon.image = dailyVM.icon
            temperature.text = dailyVM.temperatureRange
        }
    }

}
