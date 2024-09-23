//  ButtonsSettingsPage.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 30.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import Foundation
import XCTest

class ButtonsSettingsPage {
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func editFontSizeButton(){
        sleep(2)
        app.buttons.element(boundBy: 25).tap()
        app.buttons["Edit This Button"].tap()
        
        let buttonLabel = app.textFields.element(boundBy: 0)
        let existsButtonLabel = buttonLabel.waitForExistence(timeout: 5)
        XCTAssertTrue(existsButtonLabel, "The button label is not visible")
        
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText("Edit Font Size by e2e")
        
        app.textFields.element(boundBy: 2).tap()
        app.textFields.element(boundBy: 2).typeText("Pronunciation by e2e")
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.scrollViews.otherElements.buttons["35 Point"].tap()
        
        let tablesQuery = popoversQuery.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["27 Point"]/*[[".cells.staticTexts[\"27 Point\"]",".staticTexts[\"27 Point\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery.staticTexts["34 Point"].swipeUp()
        tablesQuery.staticTexts["45 Point"].swipeUp()
        tablesQuery.staticTexts["55 Point"].swipeUp()
        tablesQuery.staticTexts["65 Point"].swipeUp()
        tablesQuery.staticTexts["75 Point"].swipeUp()
        tablesQuery.staticTexts["85 Point"].swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["95 Point"]/*[[".cells.staticTexts[\"95 Point\"]",".staticTexts[\"95 Point\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        popoversQuery.navigationBars["Edit Button"].buttons["Save"].tap()
    }
    
    func checkTheForceFontSize(){
        let forceFontSize = app.switches.element(boundBy: 23)
        forceFontSize.tap()
        //XCTAssertTrue(app.buttons["E"].exists, "The force font size is not working as expected")
        forceFontSize.tap()
        XCTAssertTrue(app.buttons["Edit Font Size by e2e"].exists, "The force font size is not working as expected")
    }
    
    func checkHideButtons(){
        let hiddenButtons = app.switches.element(boundBy: 27)
        hiddenButtons.tap()
        XCTAssertTrue(app.buttons["z"].exists, "The hide button is not visible")
        hiddenButtons.tap()
        XCTAssertFalse(app.buttons["z"].exists, "The hide button is visible")
        app.buttons["Done"].tap()
    }
    
}
