//
//  ActionsPage.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 26.09.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

class ActionaPageClass {
    
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func editButtonForAction(nameButton: String){
        app.buttons.element(boundBy: 25).tap()
        app.buttons["Edit This Button"].tap()
        
        let buttonLabel = app.textFields.element(boundBy: 0)
        let existsButtonLabel = buttonLabel.waitForExistence(timeout: 5)
        XCTAssertTrue(existsButtonLabel, "The button label is not visible")
        
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText(nameButton)
    }
    
    func removeSpeechMessageAction(){
        let app = XCUIApplication()
        let popoversQuery = app.popovers
        let elementsQuery = popoversQuery.scrollViews.otherElements
        elementsQuery.buttons["Edit"].tap()
        
        let tablesQuery = XCUIApplication().popovers.scrollViews.otherElements.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Remove Speech Message"]/*[[".cells.buttons[\"Remove Speech Message\"]",".buttons[\"Remove Speech Message\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func addANewAction(actionName: String){
        let popoversQuery = app.popovers
        let elementsQuery = popoversQuery.scrollViews.otherElements
        elementsQuery.buttons["Add"].tap()
        app.staticTexts[actionName].tap()
    }
    
    func addActionDateOnly(){
        let popoversQuery = app.popovers
        let elementsQuery = popoversQuery.scrollViews.otherElements
        let tablesQuery = popoversQuery.tables
        app.staticTexts["Date Only"].tap()
        popoversQuery.navigationBars["Edit Button"].buttons["Save"].tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func checkAddMessageDisplay(){
        let popoversQuery = app.popovers
        popoversQuery.navigationBars["Edit Button"].buttons["Save"].tap()
        sleep(2)
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
        app.buttons["Add Message To Display"].tap()
        let messageText = app.textFields["Add Message To Display "]
        XCTAssertTrue(messageText.exists, "The message is not displayed")
    }
    
    func checkIfTheDateisDisplayed(){
        app.buttons["Add Action Time/Date"].tap()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        let expectedDate = dateFormatter.string(from: Date())
        
        let expectedText = app.textFields["The current date is \(expectedDate) "]
        XCTAssertTrue(expectedText.exists, "Displayed date is incorrect")
    }
    
    func saveTheAction(){
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func checkIfTheActionsWorks(){
        app.buttons["PHRASES"].press(forDuration: 1)
        app.buttons["Good Morning"].tap()
        app.buttons["Back"].tap()
        app.buttons["Backspace Key"].doubleTap()
        let sdbNewText = app.textFields["Good morning, how are you"]
        XCTAssertTrue(sdbNewText.exists, "The backspace key button doesn't work as expected")
    }
    
    func checkTheBatteryStatus(){
        app.buttons["Battery Sts"].tap()
        let batteryStsField = app.textFields["Device battery is -100% charged. "]
        XCTAssertTrue(batteryStsField.exists, "The battery status is not visible")
    }
    
    func checkTheCalculatorAction(){
        app.buttons["Calculator"].tap()
        let calcBtn1 = app.buttons["AC"]
        let calcBtn2 = app.buttons["%"]
        let calcBtn3 = app.buttons["±"]
        
        let existsCalcBtn = calcBtn1.exists && calcBtn2.exists && calcBtn3.exists
        XCTAssertTrue(existsCalcBtn, "The Calculator is not visible")
        
        app.buttons["7"].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        
        let calcResult = app.buttons["10"]
        let calcResultsExists = calcResult.waitForExistence(timeout: 5)
        XCTAssertTrue(calcResultsExists, "The calculator works as expected.")
        
        app.buttons["Done"].tap()
    }
    
    func clearLastWord(){
        app.buttons["PHRASES"].press(forDuration: 1)
        app.buttons["Good Morning"].tap()
        app.buttons["Back"].tap()
        app.buttons["Clear Last Word"].tap()
        
        let textLastWord = app.textFields["Good morning, how are "]
        XCTAssertTrue(textLastWord.exists, "The text is not correct")
    }
    
    func checkLoggingData(){
        app.buttons["Data Logging"].tap()
        let enableLogging = app.images["lam_indicator"]
        let existsEnableLogging = enableLogging.waitForExistence(timeout: 5)
        XCTAssertTrue(existsEnableLogging, "The Enable Logging image is not visible")
        app.buttons["Data Logging"].tap()
        sleep(3)
        XCTAssertFalse(enableLogging.exists, "The Enable Logging image is still visible")
        }
    
    func checkTheJumpActions(){
        //open the No Anim Page
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
        app.buttons["Jump To Page No Anim"].tap()
        let emptyButton = app.buttons.element(boundBy: 15)
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Up
        app.buttons["Jump To Page Up"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Down
        app.buttons["Jump To Page Down"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Right
        app.buttons["Jump To Page Right"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Left
        app.buttons["Jump To Page Left"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
    }
    
    func checkNavigateActions(){
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
        app.buttons["Navigate to Page No Anim"].tap()
        let emptyButton = app.buttons.element(boundBy: 15)
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Up
        app.buttons["Navigate to Page Up"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Down
        app.buttons["Navigate to Page Down"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Right
        app.buttons["Navigate to Page Right"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Left
        app.buttons["Navigate to Page Left"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
    }
    
    func addNoAnimAction(){
        app.staticTexts[".Template"].tap()
        app.staticTexts["  No Animation"].tap()
        app.buttons["Save"].tap()
    }
    
    
    func clearDisplay(){
        app.buttons["PHRASES"].press(forDuration: 1)
        app.buttons["Good Morning"].tap()
        app.buttons["Back"].tap()
        app.buttons["BackButton"].tap()
        
        let textClearDisplay = app.textFields["Good morning, how are "]
        XCTAssertTrue(textClearDisplay.exists, "The text is not correct")
        
        app.buttons["Clear Display"].tap()
        
        let textFieldSdb = app.textFields.element(boundBy: 0)
        let textFieldValue = textFieldSdb.value as? String
        
        if textFieldValue == "" || textFieldValue == nil {
            print("Text field is empty")
            XCTAssert(true, "Text field is empty as expected")
        }
        
    }
    
}
