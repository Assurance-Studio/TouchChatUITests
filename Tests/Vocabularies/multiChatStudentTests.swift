//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class MultiChatStudentTests: XCTestCase {
    
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

    
    func testLaunchMultiChatStudent() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.multiChat15Vocab)
        pages.multiChat15Vocab.tap()
        pages.multiChatStudentSS.tap()
        
        pages.verifyTheVocab(lastElement: "My Scenes", vocabWord: "I don't want", vocabElement: 11, nameElement: "I need")
        
        XCTAssertTrue(app.buttons["to wear"].exists)
        app.buttons["to wear"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "I don't want ")
        pages.backButton.tap()
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("multiChatStudent15 SS Test Finished with success!")
        
        app.terminate()
        
    }
}
