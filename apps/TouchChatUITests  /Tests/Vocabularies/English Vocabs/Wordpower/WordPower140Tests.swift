//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower140SSTests: XCTestCase {
    
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
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
    
    func testLaunchWordPower140SS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower140Position.tap()
        pages.wordPower140SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "under", vocabWord: "I...", vocabElement: 4, nameElement: "I...")
        
        XCTAssertTrue(app.buttons["I am"].exists)
        app.buttons["I am"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "I am ")
    
        commonActions.backToVocab();
        
        print("WordPower 140 SS Test Finished with success!")
        
        app.terminate()
        
    }
}
