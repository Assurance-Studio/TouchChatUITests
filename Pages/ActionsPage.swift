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
        let tablesQuery = popoversQuery.tables
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
    
    func checkIfTheDateisDisplayed(){
        app.buttons["Add Action Time/Date"].tap()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
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
    
}
