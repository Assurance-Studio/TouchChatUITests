//  openMetaAppsTests.swift
//  TouchChatUITests
//  Created by Alin V on 23.01.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class openMetaAppsTests: XCTestCase {

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
    
    
    func testOpenMetaApps() throws {
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let vocabularyName = "copied vocabulary open meta apps"
        let vocabylaryDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary open meta apps"], vocab: vocabularyName)
        
        //enable delete vocab option
<<<<<<< HEAD:Tests/ButtonActions/EditButtonActions/openMetaAppsTests.swift
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
=======
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.ensureAllowDeleteIsOn()
>>>>>>> ip_june2025:apps/TouchChatUITests/Tests/ButtonActions/EditButtonActions/openMetaAppsTests.swift
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Open Facebook Apps - Facebook")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Facebook"].tap()
        app.staticTexts["Facebook"].tap()
        app.buttons["Save"].tap()
        
        grammarActionsPage.addOpenAppsAction(button: 26, navigateDirection: "Open Facebook Apps - Facebook Messenger", actionType: "Open App", directionType: "Facebook", appType: "Facebook Messenger")
        
        grammarActionsPage.addOpenAppsAction(button: 27, navigateDirection: "Open Instagram App", actionType: "Open App", directionType: "Instagram", appType: "Instagram")
        
        //check Facebook app
        grammarActionsPage.checkFacebookApp()
        
        //check Messenger App
        grammarActionsPage.checkAppType(appType: "Open Facebook Apps - Facebook Messenger")
        
        //check Instagram App
        grammarActionsPage.checkAppType(appType: "Open Instagram App")
       
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
        print("Open Meta Apps Test Finished with success!")
    }
}
