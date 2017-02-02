//
//  WeatherForecastView.swift
//  MyWeather
//
//  Created by Mac on 06.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class WeatherForecastView: UIView {

    //MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Functions
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
