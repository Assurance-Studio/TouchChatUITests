//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchTecladoSS: XCTestCase {
    
   
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

    
    func testLaunchTecladoSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.tecladoSS.tap()
        
        pages.verifyTheVocab(lastElement: "?", vocabWord: "FRASES", vocabElement: 6, nameElement: "FRASES")
        
        XCTAssertTrue(app.buttons["Hola, ¿cómo estás?"].exists)
        app.buttons["Hola, ¿cómo estás?"].tap()
        
        pages.checkSdbText(sdbText: "Hola, ¿cómo estás? ")
        
        pages.backButton.tap()
        
        pages.backToVocab();
        
        print("Teclado SS Test Finished with success!")
        
        app.terminate()
        
    }
}





























