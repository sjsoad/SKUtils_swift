//
//  RequestBuilder.swift
//  MyWeather
//
//  Created by Mac on 02.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class UrlRequestBuilder: NSObject {

    var apiKey: String = ""
    var latitude: String = ""
    var longitude: String = ""
    var timeInterval: String?
    var excludedData: [String]?
    var language: String?
    var dataUnits: String?
    
    init(lat: Double,
         lon: Double,
         time: TimeInterval?,
         exclude: [String]?,
         lang: String?,
         units: String?) {
        apiKey = DarkSkyAPI.Credentials.ApiKey
        latitude = String(lat)
        longitude = String(lon)
        timeInterval = Converter.stringOrNil(value: time,
                                             format: "%.0f")
        excludedData = exclude
        language = lang
        dataUnits = units
    }
    
    func buildUrlString() -> String {
        if let urlComponents = NSURLComponents(string: DarkSkyAPI.API.Host)  {
            var path = "/"
            path.append(DarkSkyAPI.API.ForecastEndpoint)
            path.append("/")
            path.append(apiKey)
            path.append("/")
            path.append(latitude)
            path.append(",")
            path.append(longitude)
            if let time = timeInterval {
                path.append(",")
                path.append(time)
            }
            urlComponents.path = path
            var queryItems = [URLQueryItem]()
            if let exclude = excludedData {
                let queryItem = URLQueryItem(name: "exclude",
                                             value: exclude.joined(separator: ","))
                queryItems.append(queryItem)
            }
            if let lang = language {
                let languageItem = URLQueryItem(name: "lang",
                                                value: lang)
                queryItems.append(languageItem)
            }
            if let units = dataUnits {
                let unitsItem = URLQueryItem(name: "units",
                                             value: units)
                queryItems.append(unitsItem)
            }
            urlComponents.queryItems = queryItems
            return urlComponents.string ?? ""
        }
        return ""
    }
    
}
