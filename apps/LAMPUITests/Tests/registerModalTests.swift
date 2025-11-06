//  registerModalTests.swift
//  LAMPAppUITest
//  Created by Alin V on 17.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class registerModalTests: XCTestCase {

   
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        let pages = Pages(app: app)
        pages.checkLicenseModal()
        pages.checkStartModal()
        pages.clickWelcomeX()
   }
   
   override func tearDownWithError() throws {
       app.terminate()
       try super.tearDownWithError()
   }

   func testRegisterModalTests() throws {
       
       let pages = Pages(app: app)
       
       func randomString(length: Int) -> String{
           let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMN0123456789"
           return String((0..<length).map{ _ in characters.randomElement()! })
       }
       
       let randomText = randomString(length: 5)
       
       UIPasteboard.general.string = "EndToEndTests1"
       
       let firstNameField = app.textFields.element(boundBy: 0)
       firstNameField.tap()
       firstNameField.typeText("e2eName" + randomText)
       
       let secondNameField = app.textFields.element(boundBy: 1)
       secondNameField.tap()
       secondNameField.typeText("e2eSurname" + randomText)
       
       let emailField = app.textFields.element(boundBy: 2)
       emailField.tap()
       emailField.typeText("e2eEmail" + randomText + "@gmail.com")
       
       let confirmEmailField = app.textFields.element(boundBy: 3)
       confirmEmailField.tap()
       confirmEmailField.typeText("e2eEmail" + randomText + "@gmail.com")
       
       let passwordField = app.secureTextFields.element(boundBy: 0)
       passwordField.press(forDuration: 1)
       app.menuItems["Paste"].tap()
       
       let confirmPassField = app.secureTextFields.element(boundBy: 1)
       confirmPassField.press(forDuration: 1)
       app.menuItems["Paste"].tap()
       
       let selectCountry = app.pickerWheels["Select Country"]
       selectCountry.adjust(toPickerWheelValue: "Canada")
       
       app.buttons["checkbox"].firstMatch.tap()
       app.buttons["checkbox"].firstMatch.tap()
       
       //select the address
       let workAddress = app.buttons.matching(identifier: "checkbox").element(boundBy: 7)
       workAddress.tap()
       
       //add user details
       let phoneField = app.textFields.element(boundBy: 5)
       phoneField.tap()
       phoneField.typeText("4324324341")
       
       let companyField = app.textFields.element(boundBy: 7)
       companyField.tap()
       companyField.typeText("E2E Test Company")
       
       let addressField = app.textFields.element(boundBy: 8)
       addressField.tap()
       addressField.typeText("Test Address e2e")
       
       let cityField = app.textFields.element(boundBy: 9)
       cityField.tap()
       cityField.typeText("e2e Test City")
       sleep(3)
       
       let zipCodeField = app.textFields.element(boundBy: 10)
       zipCodeField.tap()
       zipCodeField.typeText("44332")
       
       //select the State
       let selectState = app.pickerWheels["Select State or Prov"]
       selectState.adjust(toPickerWheelValue: "California")
       
       print("Register Modal Test Finished with success!")
    }
}
