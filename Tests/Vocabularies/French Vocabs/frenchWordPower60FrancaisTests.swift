//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower60FrancaisTests: XCTestCase {
    
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

    func testLaunchWordPower60FrancaisSS() throws {
        
        let pages = Pages(app: app)
        pages.openDifferentLanguagePage(languageVocab: "French (Canada)")
        pages.scrollDownUntilElementIsVisible(element: pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.wordPower60FrancaisSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "tout", vocabWord: "je", vocabElement: 4, nameElement: "ABC 123")
        
        XCTAssertTrue(app.buttons["donne"].exists)
        app.buttons["donne"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Je ")
        
        pages.backToVocab();
        
        print("WordPower 60 Francais Test Finished with success!")
        
        app.terminate()
        
    }
}
