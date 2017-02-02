//
//  CurrentWeatherView.swift
//  MyWeather
//
//  Created by Mac on 05.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class CurrentWeatherView: UIView {

    //MARK: - Properties
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    var currentWeatherVM: CurrentWeatherViewModel? {
        didSet {
            updateUI()
        }
    }
    
    //MARK: - Functions
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateUI() {
        if let weatherVM = currentWeatherVM {
            icon.image = weatherVM.icon
            date.text = weatherVM.date
            temperature.text = weatherVM.temperature
        }
    }
    
}
