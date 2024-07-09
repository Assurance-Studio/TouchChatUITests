//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchvocabPCfrancais: XCTestCase {
    
   
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

    func testLaunchvocabPCFrancaisSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.vocabPCFrancaisSS.tap()
        
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




































