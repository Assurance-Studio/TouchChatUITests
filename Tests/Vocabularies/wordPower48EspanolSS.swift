//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchwordPower48Espanol: XCTestCase {
    
   
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

    
    func testLaunchWordPower48EspanolSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.wordPowerEspanol48.tap()
        
        pages.verifyTheVocab(lastElement: "porque", vocabWord: "comer", vocabElement: 4, nameElement: "GENTE")
        
        
        XCTAssertTrue(app.buttons["que"].exists)
        app.buttons["que"].tap()
        app.buttons["el"].tap()
        
        pages.checkSdbText(sdbText: "Comer que el ")
        
        pages.backToVocab();
        
        print("Word Power 48 Espanol SS Test Finished with success!")
        
        app.terminate()
        
    }
}































