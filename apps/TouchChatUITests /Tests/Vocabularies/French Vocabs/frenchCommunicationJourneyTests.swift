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

    func testLaunchCommunityJourneyFrancaisSS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.openDifferentLanguagePage(languageVocab: "French (Canada)")
        pages.scrollDownUntilElementIsVisible(element: pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.communicationFrancaisSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Échelles", vocabWord: "Social", vocabElement: 3, nameElement: "Objets")
        
        XCTAssertTrue(app.buttons["Comment ça va?"].exists)
        app.buttons["Comment ça va?"].tap()
        
        commonActions.checkSdbText(sdbText: "Comment ça va? ")
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        print("Communication francais Test Finished with success!")
        
        app.terminate()
        
    }
}
