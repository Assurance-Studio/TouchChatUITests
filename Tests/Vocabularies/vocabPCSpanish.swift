//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchVocabPCSpanish: XCTestCase {
    
   
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

    
    func testLaunchVocabPcSpanishSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.vocabPCSpanishSS.tap()
        
        pages.verifyTheVocab(lastElement: "tiempo", vocabWord: "quiero", vocabElement: 3, nameElement: "yo quiero")
        
        
        XCTAssertTrue(app.buttons["beber"].exists)
        app.buttons["beber"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Yo quiero buscar algo de ")
        
        pages.backToVocab();
        
        print("Vocab PC Spanish SS Test Finished with success!")
        
        app.terminate()
        
    }
}






























