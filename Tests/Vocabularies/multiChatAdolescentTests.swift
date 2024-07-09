//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class MultiChatAdolescentTests: XCTestCase {
    
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
    
    func testLaunchmultiChatAdolescent() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.multiChat15Vocab)
        pages.multiChat15Vocab.tap()
        pages.multiChatAdolescentSS.tap()
        
        pages.verifyTheVocab(lastElement: "Shopping", vocabWord: "I want", vocabElement: 10, nameElement: "I don't want")
        
        XCTAssertTrue(app.buttons["to drink"].exists)
        app.buttons["to drink"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "I want ")
        pages.backButton.tap()
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("multiChatAdolescent15 SS Test Finished with success!")
        
        app.terminate()
        
    }
}









