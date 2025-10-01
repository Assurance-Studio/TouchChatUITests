//  TouchChatUITests
//
//  Created by Alin V on 29.10.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class iShareTests: XCTestCase {

    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        commonActions.checkLicenseModal()
        commonActions.checkStartModal()
        commonActions.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testAbout() throws {
        
        let pages = Pages(app: app)
        
        func randomString(length: Int) -> String{
            let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMN0123456789"
            return String((0..<length).map{ _ in characters.randomElement()! })
        }
        
        let randomText = randomString(length: 5)
        
        UIPasteboard.general.string = "E2ePassword"
        
        pages.reachIShareService()
        
        app.buttons["Register for iShare"].tap()
        app.textFields["First Last"].tap()
        app.textFields["First Last"].typeText("Test by e2e" + randomText)
        app.textFields["name@domain.com"].tap()
        app.textFields["name@domain.com"].typeText("TestBye2e" + randomText + "@gmail.com")
        app.secureTextFields.element(boundBy: 0).press(forDuration: 1.0)
        app.menuItems["Paste"].tap()
        app.secureTextFields.element(boundBy: 1).press(forDuration: 1.0)
        app.secureTextFields.element(boundBy: 1).typeText("E2ePassword")
        
        app.textFields["Test by e2e" + randomText].tap()
        sleep(2)
        app.secureTextFields.element(boundBy: 0).tap()
        sleep(2)
        app.buttons["Register"].press(forDuration: 1)
        
        let firstRegisterIShare = app.staticTexts["Thank you for registering for iShare. You have been granted a free 365 day trial of the iShare services."]
        let existsFirstRegister = firstRegisterIShare.waitForExistence(timeout: 5)
        let secondRegisterIShare = app.staticTexts["Successful registration"]
        let existsSecondRegister = secondRegisterIShare.waitForExistence(timeout: 5)
        
        XCTAssertTrue(existsFirstRegister || existsSecondRegister, "The iShare modal is not visible")
        
        app.buttons["Okay"].tap()
        sleep(2)
        app.buttons["Sign Out"].press(forDuration: 1)
    }
}
