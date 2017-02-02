//
//  MapCurrentWeatherView+DataLoading.swift
//  MyWeather
//
//  Created by Sergey on 26.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

extension MapCurrentWeatherView {

    //MARK: - UI
    
    func loadWeatherData() {
        if let viewModel = currentWeatherVM {
            activityIndicator.startAnimating()
            clearWeatherInformation()
            viewModel.loadWeatherInformation(completion: { [weak self](currentWeatherVM) in
                guard let strongSelf = self else { return }
                strongSelf.activityIndicator.stopAnimating()
                strongSelf.fillWeatherInformation(viewModel: currentWeatherVM)
            })
        }
    }

}
