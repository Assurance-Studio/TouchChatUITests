//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Child4SSTests: XCTestCase {
    
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

    func testLaunchchild4SS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        commonActions.checkIfEnglishVocabIsExpanded()
        pages.scrollDownUntilElementIsVisible(element: pages.myQuickChatVocab)
        pages.myQuickChatVocab.tap()
        pages.childQuickChatVocab.tap()
        pages.quickChatChild4SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Greetings/Closings", vocabWord: "Playing", vocabElement: 18, nameElement: "Greetings/Closings")
        
        XCTAssertTrue(app.buttons["Can I play?"].exists)
        app.buttons["Can I play?"].tap()
        
        commonActions.checkSdbText(sdbText: "Can I play? ")
        pages.backButton.tap()
    
        commonActions.backToVocab();
        
        print("myQuickChat Child 4SS Test Finished with success!")
        
        app.terminate()
        
    }
}
