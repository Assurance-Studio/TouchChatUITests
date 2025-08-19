//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class AphasiaUKSSTests: XCTestCase {
    
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        let pages = Pages(app: app)
        
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        pages.checkLicenseModal()
        pages.checkStartModal()
        pages.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testLaunchaphasiaUKSS() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.aphasiaVocab)
        pages.aphasiaVocab.tap()
        pages.aphasiaUKSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Scales", vocabWord: "Places", vocabElement: 7, nameElement: "Social")
        
        app.buttons["Shopping"].tap()
        XCTAssertTrue(app.buttons["supermarket "].exists)
        app.buttons["supermarket "].tap()
        
        pages.checkSdbText(sdbText: "Supermarket ")
        pages.backButton.tap()
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("aphasia UK SS Test Finished with success!")
        
        app.terminate()
    }
}







