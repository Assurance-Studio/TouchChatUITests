//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Sintaxis4x5EnglishSSTests: XCTestCase {
    
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

       
    
    func testLaunchSintaxis4x5EnglishSS() throws {
      
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.sintaxis4x5English.tap()
        
        pages.verifyTheVocab(lastElement: "Transportation", vocabWord: "Toys", vocabElement: 3, nameElement: "People")
        
        
        XCTAssertTrue(app.buttons["Buy me"].exists)
        app.buttons["Buy me"].tap()
        
        pages.checkSdbText(sdbText: "Buy me ")
        
        pages.backButton.tap()
        
        pages.backToVocab();
        
        print("SinSintaxis 4x5 English Test Finished with success!")
        
        app.terminate()
        
    }
}



























