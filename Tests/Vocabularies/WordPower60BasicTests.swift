//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower60BasicSSTests: XCTestCase {
    
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
    
    func testLaunchWordPower60BasicSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower60Position.tap()
        pages.wordPower60BasicSS.tap()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "it", vocabElement: 9, nameElement: "SOCIAL")
        
        XCTAssertTrue(app.buttons["help"].exists)
        app.buttons["help"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "It ")
        
        pages.backToVocab();
        
        print("WordPower 60 Basic SS Test Finished with success!")
        
        app.terminate()
        
    }
}




















