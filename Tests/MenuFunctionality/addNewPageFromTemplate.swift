//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class addNewPageFromTemplatePageTests: XCTestCase {
    
     var app = XCUIApplication()

     override func setUpWithError() throws {
         try super.setUpWithError()
         continueAfterFailure = false
         
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

    func testAddNewPageFromTemplatePageTests() throws {
        
        let pages = Pages(app: app)
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
        
        //add a template page
        pages.addNewPage()
        pages.addNewTemplatePage()
        
        //set a name for the template page and save it
        pages.setANameForTemplatePage()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Add New Template Page Type Test Finished with success!")
    }
}
