//
//  SKValidatorsTests.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 17.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import XCTest

@testable import SKUtilsSwift

class SKValidatorsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBaseValidator() {
        let shortString = "test"
        let normalString = "normal"
        let longString = "too long string"
        let baseValidator = SKBaseValidator()
        baseValidator.minTextLenght = 5
        baseValidator.maxTextLenght = 8
        XCTAssertFalse(baseValidator.isTextValid(shortString))
        XCTAssertTrue(baseValidator.isTextValid(normalString))
        XCTAssertFalse(baseValidator.isTextValid(longString))
    }
    
    func testEmailValidator() {
        let invalidEmail = "email@invalid"
        let validEmail = "email@gmail.com"
        let emailValidator = SKEmailValidator()
        XCTAssertFalse(emailValidator.isTextValid(invalidEmail))
        XCTAssertTrue(emailValidator.isTextValid(validEmail))
    }

    func testPasswordValidator() {
        let ivalidPassword = "invalidpassword"
        let validPassword = "ValidPass1"
        let passValidator = SKPasswordValidator()
        XCTAssertFalse(passValidator.isTextValid(ivalidPassword))
        XCTAssertTrue(passValidator.isTextValid(validPassword))
    }
    
}
