//  cancelVisitTests.swift
//  TouchChatAppUITests
//  Created by Alin V on 28.03.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class cancelVisitTests: XCTestCase {

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
    
    
    func testCancelVisit() throws {
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
<<<<<<< HEAD:Tests/ButtonActions/EditButtonActions/cancelVisitTests.swift
=======
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
>>>>>>> ip_june2025:apps/TouchChatUITests/Tests/ButtonActions/EditButtonActions/cancelVisitTests.swift
        let vocabularyName = "copied vocabulary cancel visit"
        let vocabylaryDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary cancel visit"], vocab: vocabularyName)
        
        //enable delete vocab option
<<<<<<< HEAD:Tests/ButtonActions/EditButtonActions/cancelVisitTests.swift
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
=======
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.ensureAllowDeleteIsOn()
>>>>>>> ip_june2025:apps/TouchChatUITests/Tests/ButtonActions/EditButtonActions/cancelVisitTests.swift
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Cancel Visit Btn")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Cancel Visit")
        
        //save the action
        actionsPage.saveTheAction()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
        print("Cancel Visit Test Finished with success!")
    }
}
