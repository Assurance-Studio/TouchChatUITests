//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower108SSKeyboardTests: XCTestCase {
    
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
        app.launchArguments.append("--reset")
        app.launch()
        pages.clearAppCache()
        pages.resetPersistentStorage()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testLaunchWordPower108SSKeyboard() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower108Position.tap()
        pages.wordPower108SSKeyboard.tap()
        
        pages.verifyTheVocab(lastElement: "clear", vocabWord: "PEOPLE ", vocabElement: 3, nameElement: "PEOPLE ")
        
        XCTAssertTrue(app.buttons["mom"].exists)
        app.buttons["mom"].tap()
        app.buttons["T"].tap()
        app.buttons["E"].tap()
        app.buttons["S"].tap()
        pages.backButton.tap()
        app.buttons["more"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Mom ")
    
        pages.backToVocab();
        
        print("WordPower 108 Keyboard Test Finished with success!")
        
        app.terminate()
    
    }
}
