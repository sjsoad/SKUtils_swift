//
//  DailyWeatherForecastViewModel.swift
//  MyWeather
//
//  Created by Mac on 06.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

class DailyWeatherForecastViewModel: ArrayCollectionViewModelProtocol {

    //MARK: - Properties
    
    typealias ModelType = DailyWeatherModel
    typealias CellType = DailyWeatherViewCell
    
    var arrayData: [DailyWeatherModel]
    var arrayDataSource: CollectionViewArrayDataSource?
    
    //MARK: - Functions
    
    required init(array: [DailyWeatherModel]) {
        self.arrayData = array
        let forecastViewModels = createViewModels(fromModels: array)
        let sectionModel = SectionModel(withItems: forecastViewModels, header: nil, footer: nil)
        self.arrayDataSource = CollectionViewArrayDataSource(sections: [sectionModel],
                                                                  reuseIdentifier: DailyWeatherViewCell.reuseIdentifier)
    }
    
    func createViewModels(fromModels models: [DailyWeatherModel]) -> [DailyWeatherViewModel] {
        var forecastViewModels = [DailyWeatherViewModel]()
        for dailyModel in models {
            let dailyWeatherViewModel = DailyWeatherViewModel(dailyModel: dailyModel)
            forecastViewModels.append(dailyWeatherViewModel)
        }
        return forecastViewModels
    }
    
}
