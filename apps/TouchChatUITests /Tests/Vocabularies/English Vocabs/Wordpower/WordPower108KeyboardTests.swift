//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower108SSKeyboardTests: XCTestCase {
    
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

    func testLaunchWordPower108SSKeyboard() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        commonActions.checkIfEnglishVocabIsExpanded()
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower108Position.tap()
        pages.wordPower108SSKeyboard.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "clear", vocabWord: "PEOPLE", vocabElement: 3, nameElement: "PEOPLE")
        
        XCTAssertTrue(app.buttons["mom"].exists)
        app.buttons["mom"].tap()
        app.buttons["T"].tap()
        app.buttons["E"].tap()
        app.buttons["S"].tap()
        pages.backButton.tap()
        app.buttons["more"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Mom ")
    
        commonActions.backToVocab();
        
        print("WordPower 108 Keyboard Test Finished with success!")
        
        app.terminate()
    
    }
}
