//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower25SSTests: XCTestCase {
    
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
    
    func testLaunchWordPower25SS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower25Position.tap()
        pages.wordPower25TouchScan.tap()
        
        pages.verifyTheVocab(lastElement: "stop", vocabWord: "I want", vocabElement: 4, nameElement: "clear")
        
        XCTAssertTrue(app.buttons["to eat"].exists)
        app.buttons["to eat"].tap()
        app.buttons["cookies"].tap()
        
        pages.checkSdbText(sdbText: "I want to eat cookies ")
        
        pages.backButton.tap()
        pages.backToVocab();
        
        print("WordPower 25 SS Test Finished with success!")
        
        app.terminate()
        

    }
}















