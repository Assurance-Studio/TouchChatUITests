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
        let vocabularyName = "copied vocabulary"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
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
        
        let pages = Pages(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let dataLoginPage = DataLoggingPage(app: app)
        
        pages.spellingSS.tap()
        sleep(3)
        
        pages.verifyTheVocab(lastElement: "BACKSPACE", vocabWord: "PHRASES", vocabElement: 5, nameElement: "TEXTING")
        
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
        
        print("Buttons Dwell & Release Time Test Finished with success!")
        
        app.terminate()
        
    }
}
