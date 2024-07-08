//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchmultiChat15BilingualSS: XCTestCase {
    
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

    
    func testLaunchmultiChat15BilingualSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.multiChat15Bilingual.tap()
        
        pages.verifyTheVocab(lastElement: "Mis escenas - My Scenes", vocabWord: "Yo quiero - I want", vocabElement: 3, nameElement: "Preguntas - Questions")
        
        
        XCTAssertTrue(app.buttons["comer - to eat"].exists)
        app.buttons["comer - to eat"].tap()
        app.buttons["FRUTA - FRUIT"].tap()
        app.buttons["uvas - grapes"].tap()
        
        pages.checkSdbText(sdbText: "Yo quiero comer uvas ")
        
        pages.backButton.tap()
        pages.backButton.tap()
        pages.backButton.tap()
        
        pages.backToVocab();
        
        print("MutiChat 15 Bilingual Test Finished with success!")
        
        app.terminate()
    }
}























