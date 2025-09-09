//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class editAbbreviationsTests: XCTestCase {
    
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

    func testLaunchEditAbbreviations() throws {
        
        let pages = Pages(app: app)
        let abbreviationsPage = AbbreviationsPage(app: app)
        let commonActions = CommonActions(app: app)
        
        pages.spellingSS.tap()
        pages.openAVocab()
        
        //add abbreviation
        abbreviationsPage.reachAddAbbreviation()
        abbreviationsPage.addAbbreviation()
        abbreviationsPage.checkAddAbbreviation()
        commonActions.checkSdbText(sdbText: "Test by e2e ")
        
        //edit&delete abbreviation
        abbreviationsPage.reachToEditAbbreviation()
        abbreviationsPage.removeTheAbbreviation()
        
        //clearAllAbbreviation
        abbreviationsPage.reachToEditAbbreviation()
        abbreviationsPage.clearAllAbbreviations()
        
        //restoreToDefaults
        abbreviationsPage.restoreToDefaultsAbbreviation()
        
        commonActions.backToVocab();
        
        print("Edit Abbreviations Test Finished with success!")
        
        app.terminate()
        
    }
}
