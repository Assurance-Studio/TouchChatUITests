//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower25SSTests: XCTestCase {
    
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
    
    func testLaunchWordPower25SS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        commonActions.checkIfEnglishVocabIsExpanded()
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower25Position.tap()
        pages.wordPower25TouchScan.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "stop", vocabWord: "I want", vocabElement: 4, nameElement: "clear")
        
        XCTAssertTrue(app.buttons["to eat"].exists)
        app.buttons["to eat"].tap()
        app.buttons["cookies"].tap()
        
        commonActions.checkSdbText(sdbText: "I want to eat cookies ")
        
        pages.backButton.tap()
        commonActions.backToVocab();
        
        print("WordPower 25 SS Test Finished with success!")
        
        app.terminate()
    }
}
