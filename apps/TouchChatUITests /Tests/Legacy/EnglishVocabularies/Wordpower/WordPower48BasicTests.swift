//  WordPower48BasicTests.swift
//  TouchChatAppUITests
//  Created by Alin V on 07.05.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class WordPower48BasicTests: XCTestCase {

    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        let vocabName = "vocabulary"
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

    func testLaunchWordPower48BasicSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower48Position.tap()
        pages.wordPower48SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "come", vocabElement: 9, nameElement: "GROUPS")
        
        XCTAssertTrue(app.buttons["back"].exists)
        app.buttons["back"].tap()
        app.buttons["to"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Come back to ")
        
        pages.backToVocab();
        
        print("WordPower 48 SS Test Finished with success!")
    }
}
