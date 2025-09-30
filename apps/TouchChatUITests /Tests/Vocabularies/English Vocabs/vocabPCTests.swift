//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class vocabPCSSTests: XCTestCase {
    
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
    
    func testLaunchVocabPc() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        commonActions.checkIfEnglishVocabIsExpanded()
        pages.scrollDownUntilElementIsVisible(element: pages.vocabPCSS)
        pages.vocabPCSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "time", vocabWord: "I feel", vocabElement: 3, nameElement: "I want")
        
        XCTAssertTrue(app.buttons["confused"].exists)
        app.buttons["confused"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "I feel ")
    
        commonActions.backToVocab();
        
        print("VocabPC SS Test Finished with success!")
        
        app.terminate()
        
    }
}
