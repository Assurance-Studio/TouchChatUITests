//  TouchChatUITests
//
//  Create by Alin Voinescu
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

    func testLaunchEditPronunciations() throws {
        
        let pages = Pages(app: app)
        pages.spellingSS.tap()
        pages.openAVocab()
        
        //add pronunciations
        pages.reachEditPronunciations()
        pages.addPronunciations()
        
        //edit & delete pronunciations
        pages.scrollForSearchPronunciations()
        pages.searchPronunciations()
        pages.deletePronunciations()
        
        //clearAllPronunciations
        pages.clearAllPronunciations()
        
        //restoreToDefaults
        pages.restoreToDefaultsPronunciations()
        
        pages.backToVocab();
        
        print("Edit Pronunciations Test Finished with success!")
        
        app.terminate()
    
    }
}
