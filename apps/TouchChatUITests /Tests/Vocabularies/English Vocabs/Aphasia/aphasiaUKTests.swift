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

    func testLaunchaphasiaUKSS() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        commonActions.checkIfEnglishVocabIsExpanded()
        pages.scrollDownUntilElementIsVisible(element: pages.aphasiaVocab)
        pages.aphasiaVocab.tap()
        pages.aphasiaUKSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Scales", vocabWord: "Places", vocabElement: 7, nameElement: "Social")
        
        app.buttons["Shopping"].tap()
        XCTAssertTrue(app.buttons["supermarket "].exists)
        app.buttons["supermarket "].tap()
        
        commonActions.checkSdbText(sdbText: "Supermarket ")
        pages.backButton.tap()
        pages.backButton.tap()
    
        commonActions.backToVocab();
        
        print("aphasia UK SS Test Finished with success!")
        
        app.terminate()
    }
}
