//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class SinSintaxis4x4EnglishSSTests: XCTestCase {
    
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
    
    func testLaunchSinSintaxis4x4EnglishSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.sintaxis4x4English.tap()
        
        pages.verifyTheVocab(lastElement: "Places", vocabWord: "Body Parts", vocabElement: 3, nameElement: "Food/Drink")
        
        XCTAssertTrue(app.buttons["eyes"].exists)
        app.buttons["eyes"].tap()
        app.buttons["nose"].tap()
        
        pages.checkSdbText(sdbText: "Eyes nose ")
        
        pages.backButton.tap()
        
        pages.backToVocab();
        
        print("SinSintaxis 4x4 English Test Finished with success!")
        
        app.terminate()
        
    }
}

























