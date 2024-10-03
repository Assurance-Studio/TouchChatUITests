//
//  GrammarActionsPage.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 03.10.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

class GrammarActionaPageClass {
    
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    let actionsPage = ActionaPageClass(app: XCUIApplication())
    
    func addActionED(){
        app.staticTexts["add -ed"].tap()
        app.buttons["Save"].tap()
    }
    
    func addActionEN(){
        app.buttons.element(boundBy: 26).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText("Grammar Action -en")
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: "Grammar Action")
        app.staticTexts["add -en"].tap()
        app.buttons["Save"].tap()
    }
    
    func addActionER(){
        app.buttons.element(boundBy: 27).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText("Grammar Action -er")
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: "Grammar Action")
        app.staticTexts["add -er"].tap()
        app.buttons["Save"].tap()
    }
    
    func addActionEST(){
        app.buttons.element(boundBy: 28).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText("Grammar Action -est")
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: "Grammar Action")
        app.staticTexts["add -est"].tap()
        app.buttons["Save"].tap()
    }
    
    func addActionING(){
        app.buttons.element(boundBy: 29).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText("Grammar Action -ing")
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: "Grammar Action")
        app.staticTexts["add -ing"].tap()
        app.buttons["Save"].tap()
    }
    
    func addActionLY(){
        app.buttons.element(boundBy: 30).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText("Grammar Action -ly")
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: "Grammar Action")
        app.staticTexts["add -ly"].tap()
        app.buttons["Save"].tap()
    }
    
    func addActionS(){
        app.buttons.element(boundBy: 31).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText("Grammar Action -s")
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: "Grammar Action")
        app.staticTexts["add -s"].tap()
        app.buttons["Save"].tap()
    }
    
    func createAVerb(){
        app.buttons["z"].tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText("break")
        app.buttons["Save"].tap()
    }
    
    func createAnAdjective(){
        app.buttons["x"].tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText("quick")
        app.buttons["Save"].tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func checkGrammarAction(){
        //check if the grammar action -ed works as expected
        app.buttons["break"].tap()
        app.buttons["Grammar Action -ed"].tap()
        app.buttons["g"].tap()
        app.buttons["BackButton"].tap()
        //check if the grammar action -en works as expected
        app.buttons["break"].tap()
        app.buttons["Grammar Action -en"].tap()
        app.buttons["g"].tap()
        app.buttons["BackButton"].tap()
        //check if the grammar action -er works as expected
        app.buttons["break"].tap()
        app.buttons["Grammar Action -er"].tap()
        app.buttons["g"].tap()
        app.buttons["BackButton"].tap()
        //check if the grammar action -est works as expected
        app.buttons["quick"].tap()
        app.buttons["Grammar Action -est"].tap()
        app.buttons["g"].tap()
        app.buttons["BackButton"].tap()
        //check if the grammar action -ing works as expected
        app.buttons["break"].tap()
        app.buttons["Grammar Action -ing"].tap()
        app.buttons["g"].tap()
        app.buttons["BackButton"].tap()
        //check if the grammar action -ly works as expected
        app.buttons["quick"].tap()
        app.buttons["Grammar Action -ly"].tap()
        app.buttons["g"].tap()
        app.buttons["BackButton"].tap()
        //check if the grammar action -s works as expected
        app.buttons["break"].tap()
        app.buttons["Grammar Action -s"].tap()
        app.buttons["g"].tap()
        app.buttons["BackButton"].tap()
        
        let grammarActions = app.textFields["Broke broken breaker quickest breaking quickly breaks "]
        XCTAssertTrue(grammarActions.exists, "The grammar actions don't work as expected")
    }
}
