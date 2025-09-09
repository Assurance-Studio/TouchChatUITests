//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class AphasiaSpanishSSTests: XCTestCase {
    
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
       
    func testLaunchaphasiaSpanishSS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.openDifferentLanguagePage(languageVocab: "Spanish (United States)")
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.aphasiaSpanishSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Escalas", vocabWord: "Despejar", vocabElement: 7, nameElement: "Social")
        
        app.buttons["Yo"].tap()
        app.buttons["Emociones (hombre)"].tap()
        XCTAssertTrue(app.buttons["estresado"].exists)
        app.buttons["estresado"].tap()
        
        commonActions.checkSdbText(sdbText: "Estresado ")
        pages.backButton.tap()
        pages.backButton.tap()
    
        commonActions.backToVocab();
        
        print("aphasia Spanish SS Test Finished with success!")
        
        app.terminate()
        
    }
}






