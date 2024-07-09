//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class AphasiaSpanishSSTests: XCTestCase {
    
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
       
    func testLaunchaphasiaSpanishSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.aphasiaVocab)
        pages.aphasiaVocab.tap()
        pages.aphasiaSpanishSS.tap()
        
        pages.verifyTheVocab(lastElement: "Escalas", vocabWord: "Despejar", vocabElement: 7, nameElement: "Social")
        
        app.buttons["Yo"].tap()
        app.buttons["Emociones (hombre)"].tap()
        XCTAssertTrue(app.buttons["estresado"].exists)
        app.buttons["estresado"].tap()
        
        pages.checkSdbText(sdbText: "Estresado ")
        pages.backButton.tap()
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("aphasia Spanish SS Test Finished with success!")
        
        app.terminate()
        
    }
}






