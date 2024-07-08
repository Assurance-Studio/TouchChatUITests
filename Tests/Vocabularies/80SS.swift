//
//  basicTest.swift
//  TouchChatTests
//
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class e2e_TCHDWPLaunchWordPower80SS: XCTestCase {
    
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

       
    
    func testLaunchWordPower80SS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower60Position.tap()
        pages.wordPower60SS.tap()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "is", vocabElement: 3, nameElement: "ABC 123")
        
        XCTAssertTrue(app.buttons["eating"].exists)
        app.buttons["eating"].tap()
        app.buttons["the"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Is eating ")
        
        pages.backToVocab();
        
        print("WordPower 80 SS Test Finished with success!")
        
        app.terminate()
        
    }
}





















