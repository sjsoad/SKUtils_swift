//
//  ViewModelTests.swift
//  MyWeather
//
//  Created by Mac on 02.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import MyWeather

class ViewModelTests: XCTestCase {
    
    func testCurrentWeatherViewModel() {
        let JSONString = json(forKey: "currentWeather")
        let currentWeather = Mapper<CurrentWeatherModel>().map(JSONString: JSONString)
        let currentWeatherViewModel = CurrentWeatherViewModel(currentModel: currentWeather!)
        
//        XCTAssertEqual(currentWeatherViewModel.time, "1480670159.0")
        XCTAssertEqual(currentWeatherViewModel.summary, "Clear")
//        XCTAssertEqual(currentWeatherViewModel.icon, "clear-night")
        XCTAssertEqual(currentWeatherViewModel.nearestStormDistance, "248.0")
        XCTAssertEqual(currentWeatherViewModel.nearestStormBearing, "2.0")
        XCTAssertEqual(currentWeatherViewModel.precipIntensity, "0.0")
        XCTAssertEqual(currentWeatherViewModel.precipProbability, "0.0")
//        XCTAssertEqual(currentWeatherViewModel.temperature, "49.49")
        XCTAssertEqual(currentWeatherViewModel.apparentTemperature, "45.68")
        XCTAssertEqual(currentWeatherViewModel.dewPoint, "33.44")
        XCTAssertEqual(currentWeatherViewModel.humidity, "0.54")
        XCTAssertEqual(currentWeatherViewModel.windSpeed, "9.21")
        XCTAssertEqual(currentWeatherViewModel.windBearing, "356.0")
        XCTAssertEqual(currentWeatherViewModel.visibility, "10.0")
        XCTAssertEqual(currentWeatherViewModel.cloudCover, "0.0")
        XCTAssertEqual(currentWeatherViewModel.pressure, "1021.37")
        XCTAssertEqual(currentWeatherViewModel.ozone, "268.61")
    }
    
    func testDailyWeatherViewModel() {
        let JSONString = json(forKey: "dailyWeather")
        let dailyWeather = Mapper<DailyWeatherModel>().map(JSONString: JSONString)
        let dailyWeatherViewModel = DailyWeatherViewModel(dailyModel: dailyWeather!)
//        XCTAssertEqual(dailyWeatherViewModel.time, "1480665600.0")
        XCTAssertEqual(dailyWeatherViewModel.summary, "Clear throughout the day.")
//        XCTAssertEqual(dailyWeatherViewModel.icon, "clear-day")
        XCTAssertEqual(dailyWeatherViewModel.sunriseTime, "1480691368.0")
        XCTAssertEqual(dailyWeatherViewModel.sunsetTime, "1480726336.0")
        XCTAssertEqual(dailyWeatherViewModel.moonPhase, "0.1")
        XCTAssertEqual(dailyWeatherViewModel.precipIntensity, "0.0")
        XCTAssertEqual(dailyWeatherViewModel.precipIntensityMax, "0.0")
        XCTAssertEqual(dailyWeatherViewModel.precipProbability, "0.0")
        XCTAssertEqual(dailyWeatherViewModel.precipType, nil)
//        XCTAssertEqual(dailyWeatherViewModel.temperatureMin, "47.12")
        XCTAssertEqual(dailyWeatherViewModel.temperatureMinTime, "1480690800.0")
//        XCTAssertEqual(dailyWeatherViewModel.temperatureMax, "60.77")
        XCTAssertEqual(dailyWeatherViewModel.temperatureMaxTime, "1480719600.0")
        XCTAssertEqual(dailyWeatherViewModel.apparentTemperatureMin, "41.86")
        XCTAssertEqual(dailyWeatherViewModel.apparentTemperatureMinTime, "1480690800.0")
        XCTAssertEqual(dailyWeatherViewModel.apparentTemperatureMax, "60.77")
        XCTAssertEqual(dailyWeatherViewModel.apparentTemperatureMaxTime, "1480719600.0")
        XCTAssertEqual(dailyWeatherViewModel.dewPoint, "34.69")
        XCTAssertEqual(dailyWeatherViewModel.humidity, "0.5")
        XCTAssertEqual(dailyWeatherViewModel.windSpeed, "10.85")
        XCTAssertEqual(dailyWeatherViewModel.windBearing, "6.0")
        XCTAssertEqual(dailyWeatherViewModel.visibility, "10.0")
        XCTAssertEqual(dailyWeatherViewModel.cloudCover, "0.05")
        XCTAssertEqual(dailyWeatherViewModel.pressure, "1022.72")
        XCTAssertEqual(dailyWeatherViewModel.ozone, "255.78")
    }
    
    func testHourlyWeatherViewModel() {
        let JSONString = json(forKey: "hourlyWeather")
        let hourlyWeather = Mapper<HourlyWeatherModel>().map(JSONString: JSONString)
        let hourlyWeatherViewModel = HourlyWeatherViewModel(hourlyModel: hourlyWeather!)
//        XCTAssertEqual(hourlyWeatherViewModel.time, "1480669200.0")
        XCTAssertEqual(hourlyWeatherViewModel.summary, "Clear")
//        XCTAssertEqual(hourlyWeatherViewModel.icon, "clear-night")
        XCTAssertEqual(hourlyWeatherViewModel.precipIntensity, "0.0")
        XCTAssertEqual(hourlyWeatherViewModel.precipProbability, "0.0")
//        XCTAssertEqual(hourlyWeatherViewModel.temperature, "49.59")
        XCTAssertEqual(hourlyWeatherViewModel.apparentTemperature, "45.96")
        XCTAssertEqual(hourlyWeatherViewModel.dewPoint, "33.17")
        XCTAssertEqual(hourlyWeatherViewModel.humidity, "0.53")
        XCTAssertEqual(hourlyWeatherViewModel.windSpeed, "8.76")
        XCTAssertEqual(hourlyWeatherViewModel.windBearing, "354.0")
        XCTAssertEqual(hourlyWeatherViewModel.visibility, "10.0")
        XCTAssertEqual(hourlyWeatherViewModel.cloudCover, "0.0")
        XCTAssertEqual(hourlyWeatherViewModel.pressure, "1021.27")
        XCTAssertEqual(hourlyWeatherViewModel.ozone, "269.17")
    }
    
    //MARK: - Private
    
    func json(forKey key: String) -> String {
        let path = Bundle(for: ViewModelTests.self).path(forResource: "JSON", ofType: "plist")
        let dictionary = NSDictionary(contentsOfFile: path!)
        return dictionary!.value(forKey: key) as! String
    }

}
