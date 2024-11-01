//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class TecladoSSTests: XCTestCase {
    
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
