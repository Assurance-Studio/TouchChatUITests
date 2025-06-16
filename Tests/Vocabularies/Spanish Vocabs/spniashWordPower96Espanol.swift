//
//  spniashWordPower96Espanol.swift
//  TouchChatAppUITests
//
//  Created by Alin Voinescu on 06.02.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class spniashWordPower96Espanol: XCTestCase {

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

    func testLaunchWordPower96EspanolLiteTech() throws {
        
        let pages = Pages(app: app)
        pages.openDifferentLanguagePage(languageVocab: "Spanish (United States)")
        pages.scrollDownUntilElementIsVisible(pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.wordPowerLiteTech96.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "ya", vocabWord: "yo mi", vocabElement: 8, nameElement: "ACCIONES")
        
        XCTAssertTrue(app.buttons["comer"].exists)
        app.buttons["comer"].tap()
        app.buttons["la"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Yo comer ")
        
        pages.backToVocab();
        
        print("Word Power 96 Espanol Lite-Tech SS Test Finished with success!")
        
        app.terminate()
    }
}
