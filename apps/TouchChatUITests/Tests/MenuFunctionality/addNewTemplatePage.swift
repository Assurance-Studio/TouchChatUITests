//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class addNewTemplatePageTests: XCTestCase {
    
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

    func testAddNewTemplatePageTests() throws {
        
        let pages = Pages(app: app)
        let vocabularyName = "copied vocabulary template"
        let vocabylaryDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary template"], vocab: vocabularyName)

        //enable delete vocab option
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
        
        //open the Edit Page tab
        pages.editPage()
        
        //add a new blank page
        pages.addNewPage()
        pages.addNewBlankPage()
        
        //add rows and columns
        pages.addRowsColumnsBlankPage()
        
        //select page type
        pages.addTemplatePage()
        
        //add background color and select image
        pages.addBackgroundColorAndImage()
        
        //check if the iOS Gallery is opening
        pages.checkTheiOSGallery()
        
        //clear image
        pages.clearImageNewPage()
                
        XCUIApplication().navigationBars["Page by e2e"].buttons["Done"].tap()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Add Template Page Type Test Finished with success!")
    }
}
