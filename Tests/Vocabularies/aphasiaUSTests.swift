//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class AphasiaUSSSTests: XCTestCase {
    
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
    
    func testLaunchAphasiaUSSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.aphasiaVocab)
        pages.aphasiaVocab.tap()
        pages.aphasiaUSSS.tap()
        
        pages.verifyTheVocab(lastElement: "Scales", vocabWord: "Me", vocabElement: 10, nameElement: "Clear")
        
        app.buttons["Feelings"].tap()
        XCTAssertTrue(app.buttons["happy"].exists)
        app.buttons["happy"].tap()
        
        pages.checkSdbText(sdbText: "Happy ")
        pages.backButton.tap()
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("aphasia US SS Test Finished with success!")
        
        app.terminate()
    }
}
