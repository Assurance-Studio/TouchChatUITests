//  DataLoggingPage.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 28.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import Foundation
import XCTest

class DataLoggingPage {
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func checkLoggingImage(){
        let enableLoggingSwitch = app.switches.element(boundBy: 21)
        enableLoggingSwitch.tap()
        let enableLogging = app.images["lam_indicator"]
        let existsEnableLogging = enableLogging.waitForExistence(timeout: 5)
        XCTAssertTrue(existsEnableLogging, "The Enable Logging image is not visible")
        enableLoggingSwitch.tap()
        sleep(3)
        XCTAssertFalse(enableLogging.exists, "The Enable Logging image is still visible")
    }
    
    func setPrivacyPass(){
        let privacyPass = app.secureTextFields.element(boundBy: 1)
        privacyPass.tap()
        privacyPass.typeText("Test")
        
        let tablesQuery = XCUIApplication().popovers.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Realize Language™ Setup"]/*[[".cells.staticTexts[\"Realize Language™ Setup\"]",".staticTexts[\"Realize Language™ Setup\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.staticTexts["Confirm New Privacy Password"].exists, "The privacy password modal doesn't appear")
        app.secureTextFields.element(boundBy: 1).typeText("Test")
        app.buttons["Enter"].tap()
        
        XCTAssertTrue(app.staticTexts["New Password Set"].exists, "The password was not set")
        app.buttons["Okay"].tap()
        
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.navigationBars["RealizeSettingsView"].buttons["Cancel"].tap()
//        popoversQuery.tables/*@START_MENU_TOKEN@*/.buttons["Clear"]/*[[".cells.buttons[\"Clear\"]",".buttons[\"Clear\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        XCTAssertTrue(app.staticTexts["Do you really want to Clear Log?"].exists, "The Clear Log modal doesn't appear")
//        app.buttons["Yes"].tap()
//        XCTAssertTrue(app.staticTexts["Clear Log Completed"].exists, "The Clear Log is incomplete")
//        app.buttons["Okay"].tap()
        app.buttons["Done"].tap()
    }
    
    func removePrivacyPass(){
        let privacyPass = app.secureTextFields.element(boundBy: 1)
        XCUIApplication().popovers.tables.staticTexts["Speech"].swipeUp()
        XCUIApplication().popovers.tables.staticTexts["Speech Display Bar"].swipeUp()
        XCUIApplication().popovers.tables.children(matching: .cell).element(boundBy: 20).staticTexts["Font"].swipeUp()
        XCUIApplication().popovers.tables.staticTexts["Expanded Speech Area"].swipeUp()
        privacyPass.tap()
        app.secureTextFields.element(boundBy: 2).typeText("Test")
        app.buttons["Enter"].tap()
        
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.tables/*@START_MENU_TOKEN@*/.buttons["Clear text"]/*[[".cells",".secureTextFields.buttons[\"Clear text\"]",".buttons[\"Clear text\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        popoversQuery.navigationBars["Settings"].buttons["Done"].tap()
    }
    
    func changeDwellReleaseTime(){
        let tablesQuery = XCUIApplication().popovers.tables
        tablesQuery.staticTexts["Speech"].swipeUp()
        tablesQuery.staticTexts["Speech Display Bar"].swipeUp()
        tablesQuery.staticTexts["Expanded Speech Area"].swipeUp()
        tablesQuery.staticTexts["Data Logging"].swipeUp()
        XCUIApplication().popovers.tables.cells.containing(.staticText, identifier:"Dwell Time").staticTexts["None"].tap()
        app.staticTexts["4.0 Seconds"].tap()
        //change the release time
        XCUIApplication().popovers.tables.cells.containing(.staticText, identifier:"Release Time").staticTexts["None"].tap()
        app.staticTexts["1.5 Seconds"].tap()
        app.buttons["Done"].tap()
    }
    
    func checkIfTheDwellReleaseTimeWork(){
        app.buttons["PHRASES"].press(forDuration: 4)
        let buttonGoodMorning = app.buttons["Good Morning"]
        buttonGoodMorning.press(forDuration: 3.5)
        let sdbElement = app.textFields["Good morning, how are you? "]
        XCTAssertFalse(sdbElement.exists, "Searched text was found")
        buttonGoodMorning.press(forDuration: 4)
        XCTAssertTrue(sdbElement.exists, "Searched text is not correct")
        app.buttons["CLEAR "].press(forDuration: 4)
        XCTAssertTrue(sdbElement.exists, "Searched text is not correct")
    }
    
    func resetDwellReleaseTime(){
//        let tablesQuery = XCUIApplication().popovers.tables
//        tablesQuery.staticTexts["Speech"].swipeUp()
//        tablesQuery.staticTexts["Speech Display Bar"].swipeUp()
//        tablesQuery.staticTexts["Expanded Speech Area"].swipeUp()
//        tablesQuery.staticTexts["Data Logging"].swipeUp()
        XCUIApplication().popovers.tables.cells.containing(.staticText, identifier:"Dwell Time").staticTexts["4.0 Seconds"].tap()
        app.staticTexts["None"].tap()
        XCUIApplication().popovers.tables.cells.containing(.staticText, identifier:"Release Time").staticTexts["1.5 Seconds"].tap()
        app.staticTexts["None"].tap()
        app.buttons["Done"].tap()
    }
}
