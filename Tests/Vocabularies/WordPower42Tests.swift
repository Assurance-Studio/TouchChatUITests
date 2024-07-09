//  TouchChatTests
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower42SSTests: XCTestCase {
    
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

    
    func testLaunchWordPower42SS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower42Position.tap()
        pages.wordPower42SS.tap()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "go", vocabElement: 9, nameElement: "DESCRIBE")
        
        XCTAssertTrue(app.buttons["for a walk"].exists)
        app.buttons["for a walk"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Go for a walk ")
        
        pages.backToVocab();
        
        print("WordPower 42 SS Test Finished with success!")
        
        app.terminate()
    }
}

















