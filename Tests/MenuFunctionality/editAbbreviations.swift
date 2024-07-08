//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPeditAbbreviations: XCTestCase {
    
   
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

    func testLaunchEditAbbreviations() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.spellingSS)
        
        pages.spellingSS.tap()
        
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



































