//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchSpellingSS: XCTestCase {
    
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
    
    func testLaunchSpellingSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.spellingSS)
        pages.spellingSS.tap()
        
        pages.verifyTheVocab(lastElement: "BACKSPACE", vocabWord: "PHRASES", vocabElement: 5, nameElement: "TEXTING")
        
        XCTAssertTrue(app.buttons["Good Morning"].exists)
        app.buttons["Good Morning"].tap()
        
        pages.checkSdbText(sdbText: "Good morning, how are you? ")
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("Spelling SS Test Finished with success!")
        
        app.terminate()
    }
}












