//
//  AuthenticationValidationTests.swift
//  TODO-MVCTests
//
//  Created by Mohamed El-Taweel on 7/15/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import XCTest
@testable import TODO_MVC


class AuthenticationValidationTests: XCTestCase {

    let loginValidator = AuthenticationValidator()
    let registerValidator = RegisterValidator()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPhoneValidationWithWrongInput(){
        let wrongInput = "123"
        let phoneValidationResult = loginValidator.validatePhoneNumber(phoneNumber: wrongInput)
        if phoneValidationResult{
            XCTAssert(false)
        }else{
            XCTAssert(true)
        }
    }
    
    func testPhoneValidationWithCorrectInput(){
        let correctInput = "1231231231"
        let phoneValidationResult = loginValidator.validatePhoneNumber(phoneNumber: correctInput)
        if phoneValidationResult{
            XCTAssert(true)
        }else{
            XCTAssert(false)
        }

    }
    
    func testPasswordValidationWithWrongInput(){
        let wrongInput = "123"
        let passwordValidationResult = loginValidator.validatePassword(password: wrongInput)
        if passwordValidationResult{
            XCTAssert(false)
        }else{
            XCTAssert(true)
        }
    }
    
    func testPasswordValidationWithCorrectInput(){
        let correctInput = "1231231231"
        let passwordValidationResult = loginValidator.validatePassword(password: correctInput)
        if passwordValidationResult{
            XCTAssert(true)
        }else{
            XCTAssert(false)
        }
        
    }

    func testNameValidationWithWrongInput(){
        let wrongInput = "sd"
        let nameValidationResult = registerValidator.validateName(name: wrongInput)
        if nameValidationResult{
            XCTAssert(false)
        }else{
            XCTAssert(true)
        }
    }
    
    func testNameValidationWithCorrectInput(){
        let correctInput = "sddsdssd"
        let nameValidationResult = registerValidator.validateName(name: correctInput)
        if nameValidationResult{
            XCTAssert(true)
        }else{
            XCTAssert(false)
        }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
