//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower108SSTests: XCTestCase {
    
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

    func testLaunchWordPower108SS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower108Position.tap()
        pages.wordPower108SS.tap()
        
        pages.verifyTheVocab(lastElement: "clear", vocabWord: "GROUPS", vocabElement: 24, nameElement: "GROUPS")
        
        XCTAssertTrue(app.buttons["BODY"].exists)
        app.buttons["BODY"].tap()
        app.buttons["hair"].tap()
        
        pages.checkSdbText(sdbText: "Hair ")
        pages.backButton.tap()
        pages.backButton.tap()
        
        pages.backToVocab();
        
        print("WordPower 108 SS Test Finished with success!")
        
        app.terminate()
        
    }
}
