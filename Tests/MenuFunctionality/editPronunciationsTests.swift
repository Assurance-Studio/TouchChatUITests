//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class editPronunciationsTests: XCTestCase {
    
   
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

    func testLaunchEditPronunciations() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.spellingSS)
        pages.spellingSS.tap()
        
        //add pronunciations
        pages.reachEditPronunciations()
        pages.addPronunciations()
        
        //edit & delete pronunciations
        pages.scrollForSearchPronunciations()
        pages.searchPronunciations()
        pages.deletePronunciations()
        
        //clearAllPronunciations
        app.buttons["Clear"].tap()
        XCTAssertTrue(app.staticTexts["Are you sure you want to erase all?"].exists, "The clear modal doesn't appear")
        app.buttons["Yes"].tap()
        
        //restoreToDefaults
        app.buttons["Restore Defaults"].tap()
        XCTAssertTrue(app.staticTexts["Are you sure you want to restore all default values?"].exists, "The Restore Defaults modal doesn't appear")
        app.buttons["Yes"].tap()
        app.buttons["Done"].tap()
        
        pages.backToVocab();
        
        print("Edit Pronunciations Test Finished with success!")
        
        app.terminate()
        
    }
}




































