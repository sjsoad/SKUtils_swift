//
//  ConverterTests.swift
//  SKUtilsSwift
//
//  Created by Sergey on 28.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import XCTest

@testable import SKUtilsSwift

class ConverterTests: XCTestCase {
    
    func testConverterSuccess() {
        var doubleToString = Converter.stringOrEmpty(value: 0.24)
        XCTAssertNotNil(doubleToString)
        doubleToString = Converter.stringOrEmpty(value: 0.25, format: "double is %.2f")
        XCTAssertEqual(doubleToString, "double is 0.25")
        doubleToString = Converter.stringOrEmpty(value: 0.25, format: "double is %.3f")
        XCTAssertEqual(doubleToString, "double is 0.250")

    }
    
    func testConverterNil() {
        let nilValue: Double? = nil
        var doubleToString = Converter.stringOrNil(value: nilValue)
        XCTAssertNil(doubleToString)
        doubleToString = Converter.stringOrEmpty(value: nilValue)
        XCTAssertEqual(doubleToString, "")
    }
    
    func testConverterNSNumber() {
        let number = NSNumber(value: true)
        let nsnumberToString = Converter.stringOrEmpty(value: number)
        XCTAssertNotNil(nsnumberToString)
        XCTAssertEqual(nsnumberToString, "1")
    }
    
}
