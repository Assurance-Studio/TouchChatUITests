//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Adult12SSTests: XCTestCase {
    
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
        app.launchArguments.append("--reset")
        app.launch()
        pages.clearAppCache()
        pages.resetPersistentStorage()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testLaunchAdult12SS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.myQuickChatVocab)
        pages.myQuickChatVocab.tap()
        pages.adultQuickChatVocab.tap()
        pages.quickChatAdult12SS.tap()
        
        pages.verifyTheVocab(lastElement: "Interact", vocabWord: "People", vocabElement: 11, nameElement: "Clothes")
        
        XCTAssertTrue(app.buttons["Daughter"].exists)
        app.buttons["Daughter"].tap()
        
        pages.checkSdbText(sdbText: "Daughter ")
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("myQuickChat Adult 12SS Test Finished with success!")
        
        app.terminate()
        
    }
}
