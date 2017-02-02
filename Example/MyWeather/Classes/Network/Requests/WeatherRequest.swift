//
//  WeatherRequest.swift
//  MyWeather
//
//  Created by Mac on 05.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class WeatherRequest: APIRequestProtocol {

    typealias Response = WeatherResponse
    var HTTPMethod: Method = .get
    var path: String = ""
 
    required init(withURL url: String) {
        path = url
    }
    
}
