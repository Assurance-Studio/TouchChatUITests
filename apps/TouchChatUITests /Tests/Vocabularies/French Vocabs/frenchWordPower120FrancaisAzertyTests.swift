//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower120AzertyTests: XCTestCase {
    
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

    func testLaunchWordPowerAzertySS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.openDifferentLanguagePage(languageVocab: "French (Canada)")
        pages.scrollDownUntilElementIsVisible(element: pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.wordPower120Azerty.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "efface tout", vocabWord: "je", vocabElement: 4, nameElement: "QUESTNS")
        
        XCTAssertTrue(app.buttons["'adore "].exists)
        app.buttons["'adore "].tap()
        
        commonActions.checkSdbText(sdbText: "J'adore ")
        
        commonActions.backToVocab();
        
        print("WordPower 120 Francais Azerty Test Finished with success!")
        
        app.terminate()
        
    }
}
