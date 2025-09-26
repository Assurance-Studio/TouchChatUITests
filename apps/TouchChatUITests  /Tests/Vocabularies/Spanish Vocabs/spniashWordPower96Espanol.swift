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
        continueAfterFailure = true
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        commonActions.checkLicenseModal()
        commonActions.checkStartModal()
        commonActions.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testLaunchWordPower96EspanolLiteTech() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.openDifferentLanguagePage(languageVocab: "Spanish (United States)")
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.wordPowerLiteTech96.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "ya", vocabWord: "yo mi", vocabElement: 8, nameElement: "ACCIONES")
        
        XCTAssertTrue(app.buttons["comer"].exists)
        app.buttons["comer"].tap()
        app.buttons["la"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Yo comer ")
        
        commonActions.backToVocab();
        
        print("Word Power 96 Espanol Lite-Tech SS Test Finished with success!")
        
        app.terminate()
    }
}
