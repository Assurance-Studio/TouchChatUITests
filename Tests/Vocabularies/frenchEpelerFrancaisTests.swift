//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class epelerfrancaisTests: XCTestCase {
    
   
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
        app.launchArguments.append("--reset")
        app.launch()
        pages.clearAppCache()
        pages.resetPersistentStorage()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testLaunchEpelerFrancaisSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.epelerFrancaisSS.tap()
        
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





































