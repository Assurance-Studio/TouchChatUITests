//  openWebsiteTests.swift
//  TouchChatAppUITests
//  Created by Alin Voinescu on 11.02.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class openWebsiteTests: XCTestCase {

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
    
    
    func testOpenWebsite() throws {
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let vocabularyName = "copied vocabulary open website"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary open website"], vocab: vocabularyName)
        
        //enable delete vocab option
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.ensureAllowDeleteIsOn()
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Google Website Toggle On")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add website with restricted toggle turned on
        actionsPage.addANewAction(actionName: "Open Website")
        actionsPage.addWebsiteToggleOn()
        
        //add website with restricted toggle turned off
        grammarActionsPage.addWebsiteRestrictedToggleOff()
        
        //check if the Google website works as expected - Toggle On
        actionsPage.checkTheWebsiteToggleOn()
        
        //check if the Google website works as expected - Toggle Off
        actionsPage.checkTheWebsiteToggleOff()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
        print("Open Website Test Finished with success!")
    }
}
