//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class multiChat15SSTests: XCTestCase {
    
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
       

    func testLaunchmultiChat15SS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.openDifferentLanguagePage(languageVocab: "Spanish (United States)")
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.multiChat15Spanish.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Mis escenas ", vocabWord: "Yo necesito", vocabElement: 4, nameElement: "Personas")
        
        XCTAssertTrue(app.buttons["ir a la oficina"].exists)
        app.buttons["ir a la oficina"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Yo necesito ir a la ")
        
        commonActions.backToVocab();
        
        print("MutiChat 15 Test Finished with success!")
        
        app.terminate()
      
    }
}
























