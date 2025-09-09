//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Child12SSTests: XCTestCase {
    
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        commonActions.checkLicenseModal()
        commonActions.checkStartModal()
        commonActions.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }
    
    func testLaunchchild12SS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.myQuickChatVocab)
        pages.myQuickChatVocab.tap()
        pages.childQuickChatVocab.tap()
        pages.quickChatChild12SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Playing", vocabWord: "Drinks", vocabElement: 14, nameElement: "Places")
        
        XCTAssertTrue(app.buttons["Lemonade"].exists)
        app.buttons["Lemonade"].tap()
        
        commonActions.checkSdbText(sdbText: "I want some lemonade. ")
        pages.backButton.tap()
    
        commonActions.backToVocab();
        
        print("myQuickChat Child 12SS Test Finished with success!")
        
        app.terminate()
    }
}
