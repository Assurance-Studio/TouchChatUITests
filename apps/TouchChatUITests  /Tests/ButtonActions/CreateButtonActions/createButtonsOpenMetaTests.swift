//
//  createButtonOpenMetaTests.swift
//  TouchChatAppUITests
//
//  Created by Alin V on 04.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class createButtonsOpenMetaTests: XCTestCase {

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
    
    
    func testCreateButtonOpenMetaApps() throws {
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        let commonActions = CommonActions(app: app)
        let vocabularyName = "copied vocabulary open meta apps"
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
        pages.createButtonForActions(button: 25, nameButton: "Open Facebook Apps - Facebook")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Facebook"].tap()
        app.staticTexts["Facebook"].tap()
        sleep(3)
        app.buttons["Save"].tap()
        
        //remove button and add a new action - Messenger
        pages.removeAButton(button: 26)
        grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Facebook Apps - Facebook Messenger", actionType: "Open App", directionType: "Facebook", appType: "Facebook Messenger")
        
        //remove button and a new action - Instagram
        pages.removeAButton(button: 27)
        grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Instagram App", actionType: "Open App", directionType: "Instagram", appType: "Instagram")
        
        //check Facebook app
        grammarActionsPage.checkFacebookApp()
        
        //check Messenger App
        grammarActionsPage.checkAppType(appType: "Open Facebook Apps - Facebook Messenger")
        
        //check Instagram App
        grammarActionsPage.checkAppType(appType: "Open Instagram App")
       
        commonActions.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
        print("Create buttons for Open Meta Apps Test Finished with success!")
    }
}
