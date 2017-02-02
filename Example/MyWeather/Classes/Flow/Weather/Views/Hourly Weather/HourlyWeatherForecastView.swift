//
//  HorlyWeatherForecastView.swift
//  MyWeather
//
//  Created by Mac on 06.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class HourlyWeatherForecastView: WeatherForecastView, ArrayCollectionViewProtocol {

    //MARK: - Properties

    typealias ViewModelType = HourlyWeatherForecastViewModel
    var arrayDataVM: HourlyWeatherForecastViewModel? {
        didSet {
            setDataSource(collectionView: collectionView)
        }
    }
    
    //MARK: - Functions
    
}
