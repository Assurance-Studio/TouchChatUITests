//  playVideoTests.swift
//  TouchChatAppUITests
//  Created by Alin V on 25.03.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class playVideoTests: XCTestCase {

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
    
    
    func testPlayVideo() throws {
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let vocabularyName = "copied vocabulary play video"
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
        actionsPage.editButtonForAction(nameButton: "Play YouTube Video")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Play Video")
        
        //check Library Video tab
        actionsPage.checkLibraryVideoTab()
        
        //check youtube video tab and insert a video
        actionsPage.checkYoutubeVideoTab()
        
        //check if the action works as expected
        actionsPage.checkYoutubeVideoBtn()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
        print("Open Youtube Video Test Finished with success!")
    }
}
