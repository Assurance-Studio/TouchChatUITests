//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class vocabPCFrancaisTests: XCTestCase {
    
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        let vocabName = "vocabulary"
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

    func testLaunchvocabPCFrancaisSS() throws {
        
        let pages = Pages(app: app)
        pages.openDifferentLanguagePage(languageVocab: "French (Canada)")
        pages.scrollDownUntilElementIsVisible(element: pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.vocabPCFrancaisSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "temps", vocabWord: "Je suis", vocabElement: 3, nameElement: "Je veux")
        
        XCTAssertTrue(app.buttons["mélangé"].exists)
        app.buttons["mélangé"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Je suis ")
        
        pages.backToVocab();
        
        print("VocabPC Francais Test Finished with success!")
        
        app.terminate()
        
    }
}
