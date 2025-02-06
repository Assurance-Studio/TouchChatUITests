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
        let vocabularyName = "copied vocabulary"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
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
    
    func testLaunchVocabPc() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.vocabPCSS)
        pages.vocabPCSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "time", vocabWord: "I feel", vocabElement: 3, nameElement: "I want")
        
        XCTAssertTrue(app.buttons["confused"].exists)
        app.buttons["confused"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "I feel ")
    
        pages.backToVocab();
        
        print("VocabPC SS Test Finished with success!")
        
        app.terminate()
        
    }
}
