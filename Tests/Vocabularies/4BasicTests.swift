//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class test4BasicSS: XCTestCase {
    
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
    
    func testLaunch4BasicSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.basic4SS)
        pages.basic4SS.tap()
        
        pages.verifyTheVocab(lastElement: "ALL ABOUT ME", vocabWord: "I want", vocabElement: 3, nameElement: "I want")
        
        XCTAssertTrue(app.buttons["to eat"].exists)
        app.buttons["to eat"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "I want ")
    
        pages.backToVocab();
        
        print("4 Basic SS Test Finished with success!")
        
        app.terminate()
        
    }
}
