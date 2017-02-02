//
//  CurrentWeatherRequest.swift
//  MyWeather
//
//  Created by Mac on 21.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

class CurrentWeatherRequest: APIRequestProtocol {
    
    typealias Response = CurrentWeatherResponse
    var HTTPMethod: Method = .get
    var path: String = ""
    
    required init(withURL url: String) {
        path = url
    }
    
}
