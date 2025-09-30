//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Sintaxis4x5EnglishSSTests: XCTestCase {
    
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

    func testLaunchSintaxis4x5EnglishSS() throws {
      
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        commonActions.checkIfEnglishVocabIsExpanded()
        pages.sintaxis4x5English.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Transportation", vocabWord: "Toys", vocabElement: 3, nameElement: "People")
        
        XCTAssertTrue(app.buttons["Buy me"].exists)
        app.buttons["Buy me"].tap()
        
        commonActions.checkSdbText(sdbText: "Buy me ")
        
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        print("SinSintaxis 4x5 English Test Finished with success!")
        
        app.terminate()
        
    }
}



























