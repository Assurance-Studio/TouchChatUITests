//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower60BasicSSTests: XCTestCase {
    
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
    
    func testLaunchWordPower60BasicSS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        commonActions.checkIfEnglishVocabIsExpanded()
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower60Position.tap()
        pages.wordPower60BasicSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "it", vocabElement: 9, nameElement: "SOCIAL")
        
        XCTAssertTrue(app.buttons["help"].exists)
        app.buttons["help"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "It ")
        
        commonActions.backToVocab();
        
        print("WordPower 60 Basic SS Test Finished with success!")
        
        app.terminate()
        
    }
}
