//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchwordPower60EspanolBasico: XCTestCase {
    
   
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

    
    func testLaunchWordPower60EspanolBasico() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.wordPowerBasico60.tap()
        
        pages.verifyTheVocab(lastElement: "ya", vocabWord: "yo", vocabElement: 7, nameElement: "ACCIONES")
        
        XCTAssertTrue(app.buttons["espero"].exists)
        app.buttons["espero"].tap()
        app.buttons["la"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Espero ")
        
        pages.backToVocab();
        
        print("Word Power 48 Espanol Basico SS Test Finished with success!")
        
        app.terminate()
        
    }
}

































