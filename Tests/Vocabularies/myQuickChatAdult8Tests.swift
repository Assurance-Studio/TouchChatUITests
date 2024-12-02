//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Adult8SSTests: XCTestCase {
    
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
    
    func testLaunchAdult8SS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.myQuickChatVocab)
        pages.myQuickChatVocab.tap()
        pages.adultQuickChatVocab.tap()
        pages.quickChatAdult8SS.tap()
        
        pages.verifyTheVocab(lastElement: "Interact", vocabWord: "Emotions", vocabElement: 8, nameElement: "Break")
        
        XCTAssertTrue(app.buttons["Happy"].exists)
        app.buttons["Happy"].tap()
        
        pages.checkSdbText(sdbText: "I'm happy. ")
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("myQuickChat Adult 8SS Test Finished with success!")
        
        app.terminate()
       
    }
}
