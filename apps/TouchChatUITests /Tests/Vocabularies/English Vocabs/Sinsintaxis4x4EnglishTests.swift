//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class SinSintaxis4x4EnglishSSTests: XCTestCase {
    
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
    
    func testLaunchSinSintaxis4x4EnglishSS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        commonActions.checkIfEnglishVocabIsExpanded()
        pages.sintaxis4x4English.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Places", vocabWord: "Body Parts", vocabElement: 3, nameElement: "Food/Drink")
        
        XCTAssertTrue(app.buttons["eyes"].exists)
        app.buttons["eyes"].tap()
        app.buttons["nose"].tap()
        
        commonActions.checkSdbText(sdbText: "Eyes nose ")
        
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        print("SinSintaxis 4x4 English Test Finished with success!")
        
        app.terminate()
        
    }
}

























