//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower48EspanolBasicoTests: XCTestCase {
    
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

    func testLaunchWordPower48EspanolBasico() throws {
        
        let pages = Pages(app: app)
        pages.openDifferentLanguagePage(languageVocab: "Spanish (United States)")
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.wordPowerBasico48.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "ven", vocabWord: "me", vocabElement: 5, nameElement: "GENTE")
        
        XCTAssertTrue(app.buttons["gusta"].exists)
        app.buttons["gusta"].tap()
        app.buttons["estar"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Me gusta ")
        
        pages.backToVocab();
        
        print("Word Power 48 Espanol Basico SS Test Finished with success!")
        
        app.terminate()
        
    }
}
