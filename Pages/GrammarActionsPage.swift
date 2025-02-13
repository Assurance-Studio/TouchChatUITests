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
    
    let doneBtn: XCUIElement
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
        doneBtn = app.buttons["Done"]
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
    
    func addJumpAction(button: Int, jumpDirection: String, directionType: String){
        app.buttons.element(boundBy: button).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText(jumpDirection)
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: "Jump To Page")
        app.staticTexts[".Template"].tap()
        app.staticTexts[directionType].tap()
        app.buttons["Save"].tap()
    }
    
    func addNavigateAction(button: Int, navigateDirection: String, directionType: String){
        app.buttons.element(boundBy: button).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText(navigateDirection)
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: "Navigate")
        app.staticTexts[".Template"].tap()
        app.staticTexts[directionType].tap()
        app.buttons["Save"].tap()
    }
    
    func addNavigateActionsHomeBack(button: Int, navigateDirection: String, actionType: String, directionType: String){
        app.buttons.element(boundBy: button).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText(navigateDirection)
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: actionType)
        app.staticTexts[directionType].tap()
        sleep(3)
        app.buttons["Save"].tap()
    }
    
    func checkNotesApp(){
        app.buttons["Done"].tap()
        app.buttons["Open Apple Apps - Notes"].tap()
        let errorText = app.staticTexts["Error"]
        XCTAssertTrue(errorText.exists, "The error is not visible")
        app.buttons["Okay"].tap()
    }
    
    func checkGoogleApp(){
        app.buttons["Done"].tap()
        app.buttons["Open Google Apps - Google"].tap()
        let errorText = app.staticTexts["Error"]
        XCTAssertTrue(errorText.exists, "The error is not visible")
        app.buttons["Okay"].tap()
    }
    
    func checkFacebookApp(){
        app.buttons["Done"].tap()
        app.buttons["Open Facebook Apps - Facebook"].tap()
        let errorText = app.staticTexts["Error"]
        XCTAssertTrue(errorText.exists, "The error is not visible")
        app.buttons["Okay"].tap()
    }
    
    func checkAppType(appType: String){
        app.buttons[appType].tap()
        let errorText = app.staticTexts["Error"]
        XCTAssertTrue(errorText.exists, "The error is not visible")
        app.buttons["Okay"].tap()
    }
    
    func addOpenAppsAction(button: Int, navigateDirection: String, actionType: String, directionType: String, appType: String){
        app.buttons.element(boundBy: button).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText(navigateDirection)
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: actionType)
        sleep(2)
        app.staticTexts[directionType].tap()
        app.staticTexts[appType].tap()
        sleep(3)
        app.buttons["Save"].tap()
    }
    
    func checkNavigateHomeBackActions(){
        app.buttons["Done"].tap()
        app.buttons["Navigate Back Animate Up"].tap()
        app.buttons.element(boundBy: 27).tap()
        app.buttons["Navigate To Home Animate Up"].tap()
    }
    
    func addNoAnimNavigateHomeBack(){
        app.staticTexts["  No Animation"].tap()
        sleep(3)
        app.buttons["Save"].tap()
    }
    
    func openSecondPage(){
        app.buttons["PHRASES"].tap()
        app.buttons.element(boundBy: 27).tap()
    }
    
    func addVisitAction(button: Int, jumpDirection: String, directionType: String){
        app.buttons.element(boundBy: button).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText(jumpDirection)
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: "Visit")
        app.staticTexts[".Template"].tap()
        app.staticTexts[directionType].tap()
        app.buttons["Save"].tap()
    }
    
    func addSubAction(ActionName: String, buttonPosition: Int, buttonName:String, subActionName:String){
        app.buttons.element(boundBy: buttonPosition).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText(buttonName)
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: ActionName)
        app.staticTexts[subActionName].tap()
        app.buttons["Save"].tap()
    }
    
    func addSubActionGrammarProperty(ActionName: String, buttonPosition: Int, buttonName:String, subActionName:String){
        app.buttons.element(boundBy: buttonPosition).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText(buttonName)
        actionsPage.addANewAction(actionName: ActionName)
        app.staticTexts[subActionName].tap()
        app.buttons["Save"].tap()
    }
    
    func setOnDynamicLabels(){
        let tablesQuery = XCUIApplication().popovers.tables
        tablesQuery.staticTexts["Speech"].swipeUp()
        tablesQuery.staticTexts["Speech Display Bar"].swipeUp()
        tablesQuery.staticTexts["Expanded Speech Area"].swipeUp()
        tablesQuery.staticTexts["Data Logging"].swipeUp()
        tablesQuery.staticTexts["Buttons"].swipeUp()
        sleep(3)
    }
    
    func addWebsiteRestrictedToggleOff(){
        app.buttons.element(boundBy: 27).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText("Google Website Toggle Off")
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: "Open Website")
        app.textFields.element(boundBy: 0).tap()
        app.textFields.element(boundBy: 0).typeText("google.com")
        app.switches.element(boundBy: 0).tap()
        XCUIApplication().popovers.navigationBars["WebsiteURLView"].buttons["Done"].tap()
        sleep(2)
        app.buttons["Save"].tap()
        XCUIApplication().navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func checkIfTheActionsWorkAsExpected(){
        sleep(2)
        app.buttons["Done"].tap()
        
        app.buttons["Grammar State -ed"].tap()
        XCTAssertTrue(app.buttons["opened"].exists, "The word doesn't exists")
        app.buttons["Grammar State -er"].tap()
        XCTAssertTrue(app.buttons["sweeter"].exists, "The word doesn't exists")
        app.buttons["Grammar State -est"].tap()
        XCTAssertTrue(app.buttons["sweetest"].exists, "The word doesn't exists")
        app.buttons["Grammar State -ing"].tap()
        XCTAssertTrue(app.buttons["opening"].exists, "The word doesn't exists")
        app.buttons["Grammar State -ly"].tap()
        XCTAssertTrue(app.buttons["sweetly"].exists, "The word doesn't exists")
        app.buttons["Grammar State -s"].tap()
        XCTAssertTrue(app.buttons["players"].exists, "The word doesn't exists")
    }
    
    func checkAppState(){
        switch UIApplication.shared.applicationState {
        case .active:
            print("App is in the foreground")
        case .background:
            print("App is in the background")
        case .inactive:
            print("App is inactive (transitioning)")
        @unknown default:
            print("Unknown app state")
        }
    }
    
    func checkTheDynamicLabelsToggle(){
        let enableDynamicGrammarLabels = app.switches.element(boundBy: 28)
        //enableDynamicGrammarLabels.tap()
        if enableDynamicGrammarLabels.value as? String == "1" {
                // If the switch is already ON, do nothing.
                print("Switch is already ON.")
            } else {
                // If the switch is OFF, tap to turn it ON.
                enableDynamicGrammarLabels.tap()
                print("Switch has been turned ON.")
            }
    }
}
