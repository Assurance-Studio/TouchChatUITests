//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Child8SSTests: XCTestCase {
    
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
    
    func testLaunchchild8SS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.myQuickChatVocab)
        pages.myQuickChatVocab.tap()
        pages.childQuickChatVocab.tap()
        pages.quickChatChild8SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Playing", vocabWord: "Greetings/Closings", vocabElement: 18, nameElement: "Greetings/Closings")
        
        XCTAssertTrue(app.buttons["Hey!"].exists)
        app.buttons["Hey!"].tap()
        
        commonActions.checkSdbText(sdbText: "Hey! ")
        pages.backButton.tap()
    
        commonActions.backToVocab();
        
        print("myQuickChat Child 8SS Test Finished with success!")
        
        app.terminate()
        
    }
}
