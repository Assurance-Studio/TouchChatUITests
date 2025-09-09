//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower80SSTests: XCTestCase {
    
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
    
    func testLaunchWordPower80SS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower80Position.tap()
        pages.wordPower80SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "is", vocabElement: 9, nameElement: "PLACES")
        
        XCTAssertTrue(app.buttons["eating"].exists)
        app.buttons["eating"].tap()
        app.buttons["the"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Is eating ")
        
        commonActions.backToVocab();
        
        print("WordPower 80 SS Test Finished with success!")
        
        app.terminate()
        
    }
}
