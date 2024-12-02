//  TouchChatUITests
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class DeleteThePageTests: XCTestCase {
    
    
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

    func testDeleteThePageTests() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.spellingSS)
        let vocabularyName = "copied vocabulary"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary"], vocab: vocabularyName)

        //open the Edit Page tab
        pages.editPage()
        
        //add a new blank page
        pages.addNewPage()
        pages.addNewBlankPage()
        
        //add rows and columns
        pages.addRowsColumnsBlankPage()
        
        //add background color and select image
        pages.addBackgroundColorAndImage()
        
        //clear image
        pages.clearImageNewPage()
        
        //delete the page
        pages.deleteThePage()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Add & Delete Page Test Finished with success!")
    }
    
}



