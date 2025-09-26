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

    func testLaunchEditPronunciations() throws {
        
        let pages = Pages(app: app)
        let pronunctiationsPage = PronunciationsPage(app: app)
        let commonActions = CommonActions(app: app)
        pages.spellingSS.tap()
        commonActions.openAVocab()
        
        //add pronunciations
        pronunctiationsPage.reachEditPronunciations()
        pronunctiationsPage.addPronunciations()
        
        //edit & delete pronunciations
        pronunctiationsPage.scrollForSearchPronunciations()
        pronunctiationsPage.searchPronunciations()
        pronunctiationsPage.deletePronunciations()
        
        //clearAllPronunciations
        pronunctiationsPage.clearAllPronunciations()
        
        //restoreToDefaults
        pronunctiationsPage.restoreToDefaultsPronunciations()
        
        commonActions.backToVocab();
        
        print("Edit Pronunciations Test Finished with success!")
        
        app.terminate()
    
    }
}
