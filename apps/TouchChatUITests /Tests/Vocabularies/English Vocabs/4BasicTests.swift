//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class test4BasicSS: XCTestCase {
    
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
        //pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }
    
    func testLaunch4BasicSS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.basic4SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "ALL ABOUT ME", vocabWord: "I want", vocabElement: 3, nameElement: "I want")
        
        XCTAssertTrue(app.buttons["to eat"].exists)
        app.buttons["to eat"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "I want ")
    
        commonActions.backToVocab();
        
        print("4 Basic SS Test Finished with success!")
        
        app.terminate()
        
    }
}
