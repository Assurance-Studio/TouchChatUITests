//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class test4deBaseSS: XCTestCase {
    
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

    func testLaunchSintaxis4x5SpanishSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.base4FrenchSS.tap()
        
        pages.verifyTheVocab(lastElement: "TOUT SUR MOI", vocabWord: "Je veux", vocabElement: 3, nameElement: "Je veux")
        
        XCTAssertTrue(app.buttons["boire"].exists)
        app.buttons["boire"].tap()
        app.buttons["lait"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Je veux boire du ")
        
        pages.backToVocab();
        
        print("4 de base francais Test Finished with success!")
        
        app.terminate()
        
    }
}


































