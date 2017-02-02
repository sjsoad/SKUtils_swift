//
//  MapCurrentWeatherView.swift
//  MyWeather
//
//  Created by Mac on 21.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import CoreLocation

class MapCurrentWeatherView: UIView {
    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var currentWeatherVM: MapCurrentWeatherViewModel? {
        didSet {
            loadWeatherData()
        }
    }
    var currentPlaceVM: CurrentPlaceViewModel? {
        didSet {
            if let coordinate = currentPlaceVM?.coordinate() {
                currentWeatherVM = MapCurrentWeatherViewModel(withCoordinates: coordinate)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - UI
    
    func clearWeatherInformation() {
        placeName.text = nil
        summary.text = nil
        temperature.text = nil
        date.text = nil
        weatherIcon.image = nil
    }
    
    func fillWeatherInformation(viewModel: CurrentWeatherViewModel) {
        if let placeVM = currentPlaceVM {
            placeName.text = placeVM.name()
        }
        summary.text = viewModel.summary
        temperature.text = viewModel.temperature
        date.text = viewModel.date
        weatherIcon.image = viewModel.icon
    }
    
}
