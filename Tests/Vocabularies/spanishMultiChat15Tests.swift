//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class hmultiChat15SSTests: XCTestCase {
    
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
       

    func testLaunchmultiChat15SS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.multiChat15Spanish.tap()
        
        pages.verifyTheVocab(lastElement: "Mis escenas ", vocabWord: "Yo necesito", vocabElement: 4, nameElement: "Personas")
        
        XCTAssertTrue(app.buttons["ir a la oficina"].exists)
        app.buttons["ir a la oficina"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Yo necesito ir a la ")
        
        pages.backToVocab();
        
        print("MutiChat 15 Test Finished with success!")
        
        app.terminate()
      
    }
}
























