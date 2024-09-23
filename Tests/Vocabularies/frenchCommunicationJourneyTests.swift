//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class communicationJourneyFrancaisTests: XCTestCase {
    
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
        pages.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testLaunchCommunityJourneyFrancaisSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.communicationFrancaisSS.tap()
        
        pages.verifyTheVocab(lastElement: "Échelles", vocabWord: "Social", vocabElement: 3, nameElement: "Objets")
        
        XCTAssertTrue(app.buttons["Comment ça va?"].exists)
        app.buttons["Comment ça va?"].tap()
        
        pages.checkSdbText(sdbText: "Comment ça va? ")
        pages.backButton.tap()
        
        pages.backToVocab();
        
        print("Communication francais Test Finished with success!")
        
        app.terminate()
        
    }
}



































