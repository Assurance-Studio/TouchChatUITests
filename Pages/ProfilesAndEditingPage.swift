//  ProfilesAndEditingPage.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 01.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import Foundation
import XCTest

class ProfilesAndEditingPage {
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func addAProfile(){
        let app = XCUIApplication()
        app.navigationBars.buttons["Menu"].tap()
        
        let popoversQuery = app.popovers
        popoversQuery.scrollViews.otherElements.buttons["Settings"].tap()
        let saveProfileButton = popoversQuery.tables/*@START_MENU_TOKEN@*/.staticTexts["Save Profile"]/*[[".cells.staticTexts[\"Save Profile\"]",".staticTexts[\"Save Profile\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let saveProfileButtonExists = saveProfileButton.waitForExistence(timeout: 5)
        XCTAssertTrue(saveProfileButtonExists, "The Save Profile Button is not visible.")
        saveProfileButton.tap()
        
        let profileName = app.textFields.element(boundBy: 2)
        profileName.tap()
        profileName.typeText("Profile name by e2e")
        popoversQuery.navigationBars["Save Profile"].buttons["Save"].tap()
    }
    
    func checkTheOverrideMessage(){
        let popoversQuery = XCUIApplication().popovers
        let saveProfileButton = popoversQuery.tables/*@START_MENU_TOKEN@*/.staticTexts["Save Profile"]/*[[".cells.staticTexts[\"Save Profile\"]",".staticTexts[\"Save Profile\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let saveProfileButtonExists = saveProfileButton.waitForExistence(timeout: 5)
        XCTAssertTrue(saveProfileButtonExists, "The Save Profile Button is not visible.")
        saveProfileButton.tap()
        
        let profileName = app.textFields.element(boundBy: 2)
        profileName.tap()
        profileName.typeText("Profile name by e2e")
        popoversQuery.navigationBars["Save Profile"].buttons["Save"].tap()
        
        XCTAssertTrue(app.staticTexts["This filename already exists, do you want to overwrite this file?"].exists, "The filename already eists modal doens't appear")
        app.buttons["No"].tap()
        popoversQuery.navigationBars["Save Profile"].buttons["Cancel"].tap()
        app.buttons["Done"].tap()
        
        app.buttons["Back"].tap()
    }
    
    func loadTheNewProfile(){
        app.navigationBars.buttons["Menu"].tap()
        
        let popoversQuery = app.popovers
        popoversQuery.scrollViews.otherElements.buttons["Settings"].tap()
        popoversQuery.tables.staticTexts["Load Profile"].tap()
        
        app.staticTexts["Profile name by e2e"].tap()
        app.buttons["Done"].tap()
        XCTAssertTrue(app.buttons["I want"].exists, "The profile is not correct")
        
        app.navigationBars.buttons["Menu"].tap()
        popoversQuery.scrollViews.otherElements.buttons["Settings"].tap()
        popoversQuery.tables.staticTexts["Load Profile"].tap()
    }
    
    func renameTheNewProfile(){
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.navigationBars["Load Profile"].buttons["Edit"].tap()
        
        let tablesQuery = popoversQuery.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Remove Profile name by e2e"]/*[[".cells.buttons[\"Remove Profile name by e2e\"]",".buttons[\"Remove Profile name by e2e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Rename"]/*[[".cells.buttons[\"Rename\"]",".buttons[\"Rename\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields.element(boundBy: 2).doubleTap()
        app.textFields.element(boundBy: 2).typeText("e2e rename")
        popoversQuery.navigationBars["Rename"].buttons["Save"].tap()
        XCTAssertTrue(app.staticTexts["Profile name by e2e rename"].exists, "The profile name is not correct")
    }
    
    func removeTheNewProfile(){
        let popoversQuery = XCUIApplication().popovers
        let loadProfileNavigationBar = popoversQuery.navigationBars["Load Profile"]
        loadProfileNavigationBar.buttons["Edit"].tap()
        
        let tablesQuery = popoversQuery.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Remove Profile name by e2e rename"]/*[[".cells.buttons[\"Remove Profile name by e2e rename\"]",".buttons[\"Remove Profile name by e2e rename\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertFalse(app.staticTexts["Profile name by e2e rename"].exists, "The profile still exists")
        loadProfileNavigationBar.buttons["Done"].tap()
        loadProfileNavigationBar.buttons["Cancel"].tap()
        popoversQuery.navigationBars["Settings"].buttons["Done"].tap()
    }
    
    func openTheSettingsTab(){
        app.navigationBars.buttons["Menu"].tap()
        
        let popoversQuery = app.popovers
        popoversQuery.scrollViews.otherElements.buttons["Settings"].tap()
    }
    
    func setAPassMenu(){
        app.secureTextFields.element(boundBy: 0).tap()
        app.secureTextFields.element(boundBy: 0).typeText("Testbye2e")
        app.switches.element(boundBy: 7).tap()
    }
    
    func checkIfThePassWorks(){
        let app = XCUIApplication()
        let popoversQuery = app.popovers
        app.popovers.navigationBars["Settings"].buttons["Done"].tap()
        sleep(3)
        let navigationBarsQuery = app.navigationBars
        navigationBarsQuery.buttons["Menu"].tap()
        
        let passwordField = app.secureTextFields.element(boundBy: 0)
        XCTAssertTrue(passwordField.exists, "The password field doesn't appear")
        passwordField.typeText("Testbye2e")
    }
    
    func removeThePass(){
        let popoversQuery = app.popovers
        let passwordField = app.secureTextFields.element(boundBy: 0)
        sleep(2)
        popoversQuery.scrollViews.otherElements.buttons["Settings"].tap()
        app.secureTextFields.element(boundBy: 0).tap()
        app.buttons["Clear text"].tap()
        app.switches.element(boundBy: 7).tap()
        app.popovers.navigationBars["Settings"].buttons["Done"].tap()
        app.buttons["Back"].tap()
        XCTAssertFalse(passwordField.exists, "The password field doesn't appear")
    }
    
    func unCheckStatusBar(){
        let imageSizeStatusBar = app.images.element(boundBy: 20)
        let imageSizeSBarBefore = imageSizeStatusBar.frame.size
        let statusBar = app.switches.element(boundBy: 5)
        statusBar.tap()
        sleep(3)
        
        let doneButton = app.buttons["Done"]
        let doneButtonExists = doneButton.waitForExistence(timeout: 5)
        XCTAssertTrue(doneButtonExists, "Done button is not visible")
        doneButton.tap()
        
        let imageSizeSBarAfter = imageSizeStatusBar.frame.size
        
        XCTAssert(imageSizeSBarAfter.height > imageSizeSBarBefore.height, "The image size did not increase as expected")
    }
    
    func checkKeyguardInset(){
        let imageSizeKeyguard = app.images.element(boundBy: 20)
        let imageSizeKeyguardBefore = imageSizeKeyguard.frame.size
        let keyguardInset = app.switches.element(boundBy: 6)
        keyguardInset.tap()
        
        app.buttons["Done"].tap()
        
        let imageSizeKeyguardAfter = imageSizeKeyguard.frame.size
        
        XCTAssert(imageSizeKeyguardAfter.height < imageSizeKeyguardBefore.height, "The image size has not changed")
    }
    
    func returnToInitialSettingsPageSize(){
        let statusBar = app.switches.element(boundBy: 5)
        let keyguardInset = app.switches.element(boundBy: 6)
        statusBar.tap()
        keyguardInset.tap()
        app.buttons["Done"].tap()
        
    }
}
