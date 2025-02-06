//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class EngageiOSSSTests: XCTestCase {
    
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
        pages.checkLicenseModal()
        pages.checkStartModal()
        pages.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }
    
    func testLaunchEngageForiOS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.engageForiOS)
        pages.engageForiOS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "i", vocabWord: "2 BUTTONS", vocabElement: 3, nameElement: "PRACTICE")
        
        XCTAssertTrue(app.buttons["Feelings"].exists)
        app.buttons["Feelings"].tap()
        app.buttons["happy"].tap()
        
        pages.checkSdbText(sdbText: "Happy ")
        pages.backButton.tap()
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("Engage for iOS SS Test Finished with success!")
        
        app.terminate()
        
    }
}
