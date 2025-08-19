//  createButtonOpenAppleAppsTests.swift
//  TouchChatAppUITests
//  Created by Alin V on 07.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class createButtonOpenAppleAppsTests: XCTestCase {

    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        let pages = Pages(app: app)
        
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        pages.checkLicenseModal()
        pages.checkStartModal()
        pages.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }
    
    
    func testCreateButtonOpenAppleApps() throws {
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        let vocabularyName = "copied vocabulary open apple apps"
        let vocabylaryDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocab: vocabularyName)
        
        //enable delete vocab option
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Open Facebook Apps - Facebook")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Apple"].tap()
        app.staticTexts["Apple Maps"].tap()
        sleep(3)
        app.buttons["Save"].tap()
        
        //remove button and add a new action - Calendar
        pages.removeAButton(button: 26)
        grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Apple Apps - Calendar", actionType: "Open App", directionType: "Apple", appType: "Calendar")
        
        //remove button and add a new action - Notes
        pages.removeAButton(button: 27)
        grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Apple Apps - Notes", actionType: "Open App", directionType: "Apple", appType: "Notes")
        
        //remove button and add a new action - Photos
        pages.removeAButton(button: 28)
        grammarActionsPage.createButtonOpenAppsAction(button: 28, navigateDirection: "Open Apple Apps - Photos", actionType: "Open App", directionType: "Apple", appType: "Photos")
        
        //remove button and add a new action - Safari
        pages.removeAButton(button: 29)
        grammarActionsPage.createButtonOpenAppsAction(button: 29, navigateDirection: "Open Apple Apps - Safari", actionType: "Open App", directionType: "Apple", appType: "Safari")
        
        //remove button and add a new action - iMessage
        pages.removeAButton(button: 30)
        grammarActionsPage.createButtonOpenAppsAction(button: 30, navigateDirection: "Open Apple Apps - iMessage", actionType: "Open App", directionType: "Apple", appType: "iMessage")
        
        //check Notes App
        grammarActionsPage.checkNotesApp()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
        print("Create buttons for Open Apple Apps Test Finished with success!")
    }
}
