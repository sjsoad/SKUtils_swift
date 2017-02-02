//
//  DailyWeatherForecastView.swift
//  MyWeather
//
//  Created by Mac on 06.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class DailyWeatherForecastView: WeatherForecastView, ArrayCollectionViewProtocol {

    //MARK: - Properties
    
    typealias ViewModelType = DailyWeatherForecastViewModel
    var arrayDataVM: DailyWeatherForecastViewModel? {
        didSet {
            setDataSource(collectionView: collectionView)
        }
    }
    
    //MARK: - Functions
    
}
