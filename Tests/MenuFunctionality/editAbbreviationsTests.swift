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

    func testLaunchEditAbbreviations() throws {
        
        let pages = Pages(app: app)
        
        pages.spellingSS.tap()
        pages.openAVocab()
        
        //add abbreviation
        pages.reachAddAbbreviation()
        pages.addAbbreviation()
        pages.checkAddAbbreviation()
        pages.checkSdbText(sdbText: "Test by e2e ")
        
        //edit&delete abbreviation
        pages.reachToEditAbbreviation()
        pages.removeTheAbbreviation()
        
        //clearAllAbbreviation
        pages.reachToEditAbbreviation()
        pages.clearAllAbbreviations()
        
        //restoreToDefaults
        pages.restoreToDefaultsAbbreviation()
        
        pages.backToVocab();
        
        print("Edit Abbreviations Test Finished with success!")
        
        app.terminate()
        
    }
}
