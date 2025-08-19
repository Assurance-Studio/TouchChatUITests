//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower20SimplySSTests: XCTestCase {
    
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
    
    func testLaunchWordPower20SimplySS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower20Position.tap()
        pages.wordPower20SimplySS.tap()
        pages.openAVocab()
        
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
