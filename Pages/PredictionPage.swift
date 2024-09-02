//  PredictionPage.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 02.09.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import Foundation
import XCTest

class PredictionsSettingsPage {
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func checkIfThePredictionsWorks(){
        app.buttons["t"].tap()
        app.buttons["o"].tap()
        app.buttons["t"].tap()
        app.buttons["o"].tap()
        app.buttons["SPACE"].tap()
        app.buttons["t"].tap()
        app.buttons["o"].tap()
        XCTAssertTrue(app.buttons["toto "].exists, "The prediction is not visible")
    }
    
    func deleteTheNewPrediction(){
        let popoversQuery = XCUIApplication().popovers
        let tablesQuery = popoversQuery.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Prediction Type"]/*[[".cells.staticTexts[\"Prediction Type\"]",".staticTexts[\"Prediction Type\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.staticTexts["Learning + Static"].exists, "The Learning + Static option is not selected")
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Learned Words"]/*[[".cells.staticTexts[\"Learned Words\"]",".staticTexts[\"Learned Words\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        popoversQuery.toolbars["Toolbar"].buttons["Edit"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["eyes"]/*[[".cells.staticTexts[\"eyes\"]",".staticTexts[\"eyes\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery.staticTexts["happy"].swipeUp()
        tablesQuery.staticTexts["juice"].swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Remove toto"]/*[[".cells.buttons[\"Remove toto\"]",".buttons[\"Remove toto\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Delete"].tap()
        popoversQuery.navigationBars["Learned Words"].buttons["Done"].tap()
    }
    
    func addANewPrediction(){
        let popoversQuery = XCUIApplication().popovers
        let tablesQuery = popoversQuery.tables
        tablesQuery.staticTexts["Learned Words"].tap()
        XCUIApplication().popovers.navigationBars["Learned Words"].buttons["Add"].tap()
        app.textFields.element(boundBy: 2).tap()
        app.textFields.element(boundBy: 2).typeText("NewPredictionbye2e")
        app.buttons["Save"].tap()
        //edit the new prediction
        app.staticTexts["newpredictionbye2e"].tap()
        app.textFields.element(boundBy: 2).doubleTap()
        app.textFields.element(boundBy: 2).typeText("renamenewpredictionbye2e")
        app.buttons["Save"].tap()
    }
    
    func deleteTheRenamedPredictions(){
        let popoversQuery = XCUIApplication().popovers
        let tablesQuery = popoversQuery.tables
        popoversQuery.toolbars["Toolbar"].buttons["Edit"].tap()
        tablesQuery.buttons["Remove renamenewpredictionbye2e"].tap()
        app.buttons["Delete"].tap()
        app.buttons["Done"].firstMatch.tap()
        XCUIApplication().popovers.navigationBars["Settings"].buttons["Done"].tap()
    }
    
}
