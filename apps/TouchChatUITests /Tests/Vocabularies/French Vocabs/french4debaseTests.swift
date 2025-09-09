//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class test4deBaseSS: XCTestCase {
    
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

    func testLaunchFrench4Base4SS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.openDifferentLanguagePage(languageVocab: "French (Canada)")
        pages.scrollDownUntilElementIsVisible(element: pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.base4FrenchSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "TOUT SUR MOI", vocabWord: "Je veux", vocabElement: 3, nameElement: "Je veux")
        
        XCTAssertTrue(app.buttons["boire"].exists)
        app.buttons["boire"].tap()
        app.buttons["lait"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Je veux boire du ")
        
        commonActions.backToVocab();
        
        print("4 de base francais Test Finished with success!")
        
        app.terminate()
    }
}
