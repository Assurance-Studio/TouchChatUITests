//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchSintaxis4x5SpanishSS: XCTestCase {
    
   
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
    
    func testLaunchSintaxis4x5SpanishSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.sintaxis4x5Spanish.tap()
        
        pages.verifyTheVocab(lastElement: " transporte", vocabWord: "comida", vocabElement: 4, nameElement: "lugares")
        
        
        XCTAssertTrue(app.buttons["pescado"].exists)
        app.buttons["pescado"].tap()
        app.buttons["pan"].tap()
        
        pages.checkSdbText(sdbText: "Pescado pan ")
        
        pages.backButton.tap()
        
        pages.backToVocab();
        
        print("SinSintaxis 4x5 Spanish Test Finished with success!")
        
        app.terminate()
        
    }
}




























