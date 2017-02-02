//
//  HorlyWeatherForecastViewModel.swift
//  MyWeather
//
//  Created by Mac on 06.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

class HourlyWeatherForecastViewModel: ArrayCollectionViewModelProtocol {

    //MARK: - Properties
    
    typealias ModelType = HourlyWeatherModel
    typealias CellType = HourlyWeatherViewCell
    
    var arrayData: [HourlyWeatherModel]
    var arrayDataSource: CollectionViewArrayDataSource?
    
    //MARK: - Functions
    
    required init(array: [HourlyWeatherModel]) {
        self.arrayData = array
        let forecastViewModels = createViewModels(fromModels: array)
        let sectionModel = SectionModel(withItems: forecastViewModels, header: nil, footer: nil)
        self.arrayDataSource = CollectionViewArrayDataSource(sections: [sectionModel],
                                                             reuseIdentifier: HourlyWeatherViewCell.reuseIdentifier)
    }
    
    func createViewModels(fromModels models: [HourlyWeatherModel]) -> [HourlyWeatherViewModel] {
        var forecastViewModels = [HourlyWeatherViewModel]()
        for hourlyModel in models {
            let hourlyWeatherViewModel = HourlyWeatherViewModel(hourlyModel: hourlyModel)
            forecastViewModels.append(hourlyWeatherViewModel)
        }
        return forecastViewModels
    }
    
}
