//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower42BasicSSTests: XCTestCase {
    
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
    
    func testLaunchWordPower42BasicSS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        commonActions.checkIfEnglishVocabIsExpanded()
        pages.scrollDownUntilElementIsVisible(element: pages.wordPowerVocab)
        pages.wordPowerVocab.tap()
        pages.wordPower42Position.tap()
        pages.wordPower42BasicSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "clear", vocabWord: "PLACES", vocabElement: 7, nameElement: "TIME")
        
        XCTAssertTrue(app.buttons["restaurant"].exists)
        app.buttons["restaurant"].tap()
        app.buttons["can"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Restaurant ")
        
        commonActions.backToVocab();
        
        print("WordPower 42 Basic SS Test Finished with success!")
        
        app.terminate()
            
    }
}
