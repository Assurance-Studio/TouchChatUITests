//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class afasiaEspanolSSTests: XCTestCase {
    
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

    func testLaunchafasiaEspanolSS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.openDifferentLanguagePage(languageVocab: "Spanish (United States)")
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.aphasiaSpanishSS.tap()
        commonActions.openAVocab()
        pages.verifyTheVocab(lastElement: "Escalas", vocabWord: "Mis Actividades", vocabElement: 3, nameElement: "Cosas")
        
        XCTAssertTrue(app.buttons["Terapia"].exists)
        app.buttons["Terapia"].tap()
        app.buttons["muy difícil"].tap()
        
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Esto es muy ")
        
        pages.backButton.tap()
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        print("Afasia Espanol Test Finished with success!")
        
        app.terminate()

    }
}






















