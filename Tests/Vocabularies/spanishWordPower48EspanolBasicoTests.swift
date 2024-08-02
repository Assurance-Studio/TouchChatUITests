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

    func testLaunchWordPower48EspanolBasico() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.wordPowerBasico48.tap()
        
        pages.verifyTheVocab(lastElement: "ven", vocabWord: "me", vocabElement: 4, nameElement: "GENTE")
        
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
