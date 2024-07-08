//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchWordPower20SimplySS: XCTestCase {
    
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

       
    
    func testLaunchWordPower20SimplySS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower20Position.tap()
        pages.wordPower20SimplySS.tap()
        
        pages.verifyTheVocab(lastElement: "GROUPS", vocabWord: "I like", vocabElement: 4, nameElement: "QUESTIONS")
        
        XCTAssertTrue(app.buttons["to drink"].exists)
        app.buttons["to drink"].tap()
        app.buttons["juice"].tap()
        
        pages.checkSdbText(sdbText: "I like to drink juice ")
        
        pages.backButton.tap()
        pages.backButton.tap()
        
        pages.backToVocab();
        
        print("WordPower 20 Simply SS Test Finished with success!")
        
        app.terminate()
   
    }
}















