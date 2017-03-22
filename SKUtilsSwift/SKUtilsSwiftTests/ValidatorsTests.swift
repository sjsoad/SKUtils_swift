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
    
    func testBaseValidator() {
        let shortString = "test"
        let normalString = "normal"
        let longString = "too long string"
        let baseValidator = BaseValidator()
        baseValidator.minTextLenght = 5
        baseValidator.maxTextLenght = 8
        XCTAssertFalse(baseValidator.isValid(shortString))
        XCTAssertTrue(baseValidator.isValid(normalString))
        XCTAssertFalse(baseValidator.isValid(longString))
    }
    
    func testEmailValidator() {
        let invalidEmail = "email@invalid"
        let validEmail = "email@gmail.com"
        let emailValidator = EmailValidator()
        XCTAssertFalse(emailValidator.isValid(invalidEmail))
        XCTAssertTrue(emailValidator.isValid(validEmail))
    }

    func testPasswordValidator() {
        let invalidPassword = "invalidpassword"
        let validPassword = "ValidPass1"
        let passValidator = PasswordValidator()
        XCTAssertFalse(passValidator.isValid(invalidPassword))
        XCTAssertTrue(passValidator.isValid(validPassword))
    }
    
    func testEqualValidator() {
        let firstString = "some string"
        let secondString = "string to compare"
        let thirdString = "string to compare"
        let equalValidator = EqualStringsValidator()
        XCTAssertFalse(equalValidator.isEqual(nil, secondString: nil))
        XCTAssertFalse(equalValidator.isEqual(firstString, secondString: secondString))
        XCTAssertTrue(equalValidator.isEqual(thirdString, secondString: secondString))
    }
    
}
