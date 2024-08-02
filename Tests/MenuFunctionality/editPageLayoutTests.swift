//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class EditPageLayoutTests: XCTestCase {
    
     var app = XCUIApplication()

     override func setUpWithError() throws {
         try super.setUpWithError()
         continueAfterFailure = false
         
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

    func testEditPageLayoutPage() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.spellingSS)
        let vocabularyName = "copied vocabulary pagelayout"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary pagelayout"], vocab: vocabularyName)

        //open the Edit Page Layout tab
        pages.editPage()
        pages.addPageLayout()
        
        //change the page name
        pages.changeThePageName()
        
        //change the rows and columns
        pages.changeRowsAndColumns()
        
        //select image
        pages.selectImageLayout()
        
        //clear image and save the section
        pages.clearImageLayout()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Edit Page Layout Test Finished with success!")
    }
}
