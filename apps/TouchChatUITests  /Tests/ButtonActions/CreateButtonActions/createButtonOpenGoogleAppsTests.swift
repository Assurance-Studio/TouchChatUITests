//  createButtonOpenGoogleAppsTests.swift
//  TouchChatAppUITests
//  Created by Alin V on 07.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class createButtonOpenGoogleAppsTests: XCTestCase {

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
    
    
    func testOpenGoogleApplications() throws {
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        let commonActions = CommonActions(app: app)
        let vocabularyName = "copied vocabulary open google apps"
        let vocabularyDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        
        //enable delete vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Open Google Apps - GMail")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Google"].tap()
        app.staticTexts["GMail"].tap()
        app.buttons["Save"].tap()
        
        //create Google button
        pages.removeAButton(button: 26)
        grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Google Apps - Google", actionType: "Open App", directionType: "Google", appType: "Google")
        
        //create Google Docs button
        pages.removeAButton(button: 27)
        grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Google Apps - Google Docs", actionType: "Open App", directionType: "Google", appType: "Google Docs")
        
        //create Google Drive button
        pages.removeAButton(button: 28)
        grammarActionsPage.createButtonOpenAppsAction(button: 28, navigateDirection: "Open Google Apps - Google Drive", actionType: "Open App", directionType: "Google", appType: "Google Drive")
        
        //create Google Maps button
        pages.removeAButton(button: 29)
        grammarActionsPage.createButtonOpenAppsAction(button: 29, navigateDirection: "Open Google Apps - Google Maps", actionType: "Open App", directionType: "Google", appType: "Google Maps")
        
        //create Google Slides button
        pages.removeAButton(button: 30)
        grammarActionsPage.createButtonOpenAppsAction(button: 30, navigateDirection: "Open Google Apps - Google Slides", actionType: "Open App", directionType: "Google", appType: "Google Slides")
        
        //check Google app
        grammarActionsPage.checkGoogleApp()
        
        //check Google Docs app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Docs")
        
        //check Google Drive app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Drive")
        
        //check Google Google Maps app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Maps")
        
        //check Google Slides app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Slides")
        
        //check Gmail app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - GMail")
        
        commonActions.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
        print("Open Google Apps Test Finished with success!")
    }
}
