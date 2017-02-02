//
//  UrlRequestBuilderTests.swift
//  MyWeather
//
//  Created by Mac on 02.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import XCTest
@testable import MyWeather

class UrlRequestBuilderTests: XCTestCase {
    
    func testUrlRequestBuilder() {

        let urlRequestBuilder = UrlRequestBuilder(lat: 90.0,
                                                  lon: 50.0,
                                                  time: nil,
                                                  exclude: ["flags"],
                                                  lang: "en",
                                                  units: nil)
        let urlString = urlRequestBuilder.buildUrlString()
        XCTAssertEqual(urlString, "https://api.darksky.net/forecast/f459908191298bfcc249811179067e9e/90.0,50.0?exclude=flags&lang=en")
    }
    
    func testUrlRequestBuilderLanguage() {
        let urlRequestBuilder = UrlRequestBuilder(lat: 90.0,
                                                  lon: 50.0,
                                                  time: nil,
                                                  exclude: nil,
                                                  lang: "uk",
                                                  units: nil)
        let urlString = urlRequestBuilder.buildUrlString()
        XCTAssertEqual(urlString, "https://api.darksky.net/forecast/f459908191298bfcc249811179067e9e/90.0,50.0?lang=uk")
    }
    
    func testUrlRequestBuilderUnits() {
        let urlRequestBuilder = UrlRequestBuilder(lat: 90.0,
                                                  lon: 50.0,
                                                  time: 409467600,
                                                  exclude: nil,
                                                  lang: nil,
                                                  units: "si")
        let urlString = urlRequestBuilder.buildUrlString()
        XCTAssertEqual(urlString, "https://api.darksky.net/forecast/f459908191298bfcc249811179067e9e/90.0,50.0,409467600?units=si")
    }
    
    func testUrlRequestBuilderExclude() {
        let urlRequestBuilder = UrlRequestBuilder(lat: 90.0,
                                                  lon: 50.0,
                                                  time: nil,
                                                  exclude: ["minutely", "flags"],
                                                  lang: nil,
                                                  units: nil)
        let urlString = urlRequestBuilder.buildUrlString()
        XCTAssertEqual(urlString, "https://api.darksky.net/forecast/f459908191298bfcc249811179067e9e/90.0,50.0?exclude=minutely,flags")
    }
    
}
