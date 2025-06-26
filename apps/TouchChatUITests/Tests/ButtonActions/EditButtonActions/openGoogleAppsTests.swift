//
//  openGoogleAppsTests.swift
//  TouchChatUITests
//
//  Created by Alin V on 23.01.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class openGoogleAppsTests: XCTestCase {

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
    
    
    func testOpenGoogleApps() throws {
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let vocabularyName = "copied vocabulary open google apps"
        let vocabylaryDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary open google apps"], vocab: vocabularyName)
        
        //enable delete vocab option
<<<<<<< HEAD:Tests/ButtonActions/EditButtonActions/openGoogleAppsTests.swift
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
=======
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.ensureAllowDeleteIsOn()
>>>>>>> ip_june2025:apps/TouchChatUITests/Tests/ButtonActions/EditButtonActions/openGoogleAppsTests.swift
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Open Google Apps - GMail")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Google"].tap()
        app.staticTexts["GMail"].tap()
        app.buttons["Save"].tap()
        
        grammarActionsPage.addOpenAppsAction(button: 26, navigateDirection: "Open Google Apps - Google", actionType: "Open App", directionType: "Google", appType: "Google")
        
        grammarActionsPage.addOpenAppsAction(button: 27, navigateDirection: "Open Google Apps - Google Docs", actionType: "Open App", directionType: "Google", appType: "Google Docs")
        
        grammarActionsPage.addOpenAppsAction(button: 28, navigateDirection: "Open Google Apps - Google Drive", actionType: "Open App", directionType: "Google", appType: "Google Drive")
        
        grammarActionsPage.addOpenAppsAction(button: 29, navigateDirection: "Open Google Apps - Google Maps", actionType: "Open App", directionType: "Google", appType: "Google Maps")
        
        grammarActionsPage.addOpenAppsAction(button: 30, navigateDirection: "Open Google Apps - Google Slides", actionType: "Open App", directionType: "Google", appType: "Google Slides")
        
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
        
            
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
        print("Open Google Apps Test Finished with success!")
    }
}
