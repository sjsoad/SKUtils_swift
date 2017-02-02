//
//  CurrentWeatherViewController.swift
//  MyWeather
//
//  Created by Mac on 29.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: - Properties
    
    var weatherVM = WeatherViewModel()
    @IBOutlet weak var currentWeatherView: CurrentWeatherView!
    @IBOutlet weak var hourlyWeatherForecastView: HourlyWeatherForecastView!
    @IBOutlet weak var dailyWeatherForecastView: DailyWeatherForecastView!
    
    //MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherVM.updateUI.bind { [weak self] (updateUI) in
            guard let strongSelf = self else { return }
            if updateUI {
                strongSelf.updateUI()
            }
        }
        weatherVM.errorMessage.bind { (message) in
            if message.characters.count > 0 {
                print(message)
            }
        }
        weatherVM.weatherRequest()
    }

    func updateUI() {
        currentWeatherView.currentWeatherVM = weatherVM.currentWeatherVM()
        hourlyWeatherForecastView.arrayDataVM = weatherVM.hourlyWeatherForecastVM()
        dailyWeatherForecastView.arrayDataVM = weatherVM.dailyWeatherForecastVM()
    }
    
}
