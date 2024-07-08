//
//  basicTest.swift
//  TouchChatTests
//
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class e2e_TCHDWPLaunchWordPower48SS: XCTestCase {
    
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

    
    func testLaunchWordPower48SS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower48Position.tap()
        pages.wordPower48SS.tap()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "come", vocabElement: 9, nameElement: "GROUPS")
        
        XCTAssertTrue(app.buttons["back"].exists)
        app.buttons["back"].tap()
        app.buttons["to"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Come back to ")
        
        pages.backToVocab();
        
        print("WordPower 48 SS Test Finished with success!")
        
        app.terminate()
    }
}


















