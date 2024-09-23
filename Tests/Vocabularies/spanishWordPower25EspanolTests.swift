//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower25EspanolTests: XCTestCase {
    
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

    func testLaunchWordPower25EspanolSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.wordPowerEspanol25.tap()
        
        pages.verifyTheVocab(lastElement: "jugar", vocabWord: "toma", vocabElement: 4, nameElement: "borrar")
        
        XCTAssertTrue(app.buttons["una foto"].exists)
        app.buttons["una foto"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Toma una ")
        
        pages.backToVocab();
        
        print("Word Power 25 Espanol SS Test Finished with success!")
        
        app.terminate()
        
    }
}
