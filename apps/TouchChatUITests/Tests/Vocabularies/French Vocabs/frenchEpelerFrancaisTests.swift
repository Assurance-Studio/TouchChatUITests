//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class epelerFrancaisTests: XCTestCase {
    
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

    func testLaunchEpelerFrancaisSS() throws {
        
        let pages = Pages(app: app)
        pages.openDifferentLanguagePage(languageVocab: "French (Canada)")
        pages.scrollDownUntilElementIsVisible(element: pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.epelerFrancaisSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "?", vocabWord: "PHRASES", vocabElement: 6, nameElement: "PHRASES")
        
        XCTAssertTrue(app.buttons["Bonjour!"].exists)
        app.buttons["Bonjour!"].tap()
        
        pages.checkSdbText(sdbText: "Bonjour, comment-allez vous? ")
        pages.backButton.tap()
        
        pages.backToVocab();
        
        print("Epeler Francais Test Finished with success!")
        
        app.terminate()
        
    }
}
