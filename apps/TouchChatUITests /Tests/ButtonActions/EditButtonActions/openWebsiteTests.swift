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
    
    
    func testOpenWebsite() throws {
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        let commonActions = CommonActions(app: app)
        let vocabularyName = "copied vocabulary open website"
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
        
        commonActions.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
        print("Open Website Test Finished with success!")
    }
}
