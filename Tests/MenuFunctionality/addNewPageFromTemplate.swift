//  TouchChatUITests
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class addNewPageFromTemplatePageTests: XCTestCase {
    
    
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

    func testAddNewPageFromTemplatePageTests() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.spellingSS)
        let vocabularyName = "copied vocabulary from template"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary from template"], vocab: vocabularyName)

        //open the Edit Page tab
        pages.editPage()
        
        //add a new blank page
        pages.addNewPage()
        
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let newPageTemplate = elementsQuery.buttons["New Page from Template"]
        let existsNewBlankPage = newPageTemplate.waitForExistence(timeout: 5)
        
        newPageTemplate.tap()
        
        app.textFields.element(boundBy: 0).tap()
        app.textFields.element(boundBy: 0).typeText("Test by e2e Template")
        
        app.popovers.navigationBars["New Page Name"].buttons["Save"].tap()
        app.navigationBars["Test by e2e Template"].buttons["Done"].tap()
        
//        pages.addNewBlankPage()
//        
//        //add rows and columns
//        pages.addRowsColumnsBlankPage()
//        
//        //select page type
//        pages.addTemplatePage()
//        
//        //add background color and select image
//        pages.addBackgroundColorAndImage()
//        
//        //clear image
//        pages.clearImageNewPage()
//                
//        XCUIApplication().navigationBars["Page by e2e"].buttons["Done"].tap()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Add New Template Page Type Test Finished with success!")
    }
    
}






