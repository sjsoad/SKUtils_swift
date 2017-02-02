//
//  MapCurrentWeatherViewModel.swift
//  MyWeather
//
//  Created by Mac on 21.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class MapCurrentWeatherViewModel: NSObject {

    var coordinate: CLLocationCoordinate2D
    var currentRequest: Request?
    
    init(withCoordinates coordinates: CLLocationCoordinate2D) {
        self.coordinate = coordinates
    }
    
    //MARK: - Public
    
    func loadWeatherInformation(completion: @escaping ((CurrentWeatherViewModel) -> Void)) {
        let urlString = requestUrlString()
        let weatherReuest = CurrentWeatherRequest(withURL: urlString)
        let apiClient = SKUtils.delegate().apiClient
        cancelCurrentRequest(apiClient: apiClient)
        let successHandler: (_ response: CurrentWeatherRequest.Response) -> Void = { response in
            if let currentWeatherModel = response.currentWeatherModel {
                let currentWeatherVM = CurrentWeatherViewModel(currentModel: currentWeatherModel)
                completion(currentWeatherVM)
            }
        }
        currentRequest = apiClient.executeRequest(request: weatherReuest,
                                                  success: successHandler)
    }
    
    //MARK: - Private
    
    private func requestUrlString() -> String {
        let urlRequestBuilder = UrlRequestBuilder(lat: coordinate.latitude,
                                                  lon: coordinate.longitude,
                                                  time: nil,
                                                  exclude: ["minutely", "daily", "hourly", "flags"],
                                                  lang: LocalizationHelper.localization(),
                                                  units: nil)
        let urlString = urlRequestBuilder.buildUrlString()
        return urlString
    }
    
    private func cancelCurrentRequest(apiClient: APIClient) {
        if let request = currentRequest {
            apiClient.cancel(task: request.task)
        }
    }
    
}
