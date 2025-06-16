//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class multiChat15FrancaisTests: XCTestCase {
   
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
        app.launchArguments.append("--reset-app-state")
        app.launch()
        pages.checkLicenseModal()
        pages.checkStartModal()
        pages.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testLaunchMultiChat15FrancaisSS() throws {
        
        let pages = Pages(app: app)
        pages.openDifferentLanguagePage(languageVocab: "French (Canada)")
        pages.scrollDownUntilElementIsVisible(pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.multiChat15FrancaisSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Mon environnement", vocabWord: "J'ai besoin", vocabElement: 3, nameElement: "Questions ")
        
        XCTAssertTrue(app.buttons["de prendre un pause"].exists)
        app.buttons["de prendre un pause"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "J'ai besoin de prendre une ")
        
        pages.backToVocab();
        
        print("MultiChat15 Francais Test Finished with success!")
        
        app.terminate()
        
    }
}
