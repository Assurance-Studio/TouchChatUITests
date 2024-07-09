//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchchild12SS: XCTestCase {
    
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
    
    func testLaunchchild12SS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.myQuickChatVocab)
        pages.myQuickChatVocab.tap()
        pages.childQuickChatVocab.tap()
        pages.quickChatChild12SS.tap()
        
        pages.verifyTheVocab(lastElement: "Playing", vocabWord: "Drinks", vocabElement: 14, nameElement: "Places")
        
        XCTAssertTrue(app.buttons["Lemonade"].exists)
        app.buttons["Lemonade"].tap()
        
        pages.checkSdbText(sdbText: "I want some lemonade. ")
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("myQuickChat Child 12SS Test Finished with success!")
        
        app.terminate()
       
    }
}













