//  TouchChatUITests
//
//  Created by Alin Voinescu on 28.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class buttonsDwellReleaseTimeTests: XCTestCase {

    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        let pages = Pages(app: app)
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        pages.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }
    
    func testButtonsDwellReleaseTime() throws {
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        let vocabularyName = "copied vocabulary button Dwell Time"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        let pages = Pages(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let dataLoginPage = DataLoggingPage(app: app)
       
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary button Dwell Time"], vocab: vocabularyName)
        
        //open the settings menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //change the dwell & release time
        dataLoginPage.changeDwellReleaseTime()
        
        //check if the new settings work
        dataLoginPage.checkIfTheDwellReleaseTimeWork()
        
        //reset the dwell & release time
        profilesAndEditingPage.openTheSettingsTab()
        dataLoginPage.resetDwellReleaseTime()
        
        pages.backButton.tap()
        pages.backToVocab();
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Buttons Dwell & Release Time Test Finished with success!")
        
        app.terminate()
        
    }
}
