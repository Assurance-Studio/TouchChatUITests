//
//  addNewSpanishPageTests.swift
//  LAMPUITests
//
//  Created by Alin V on 22.11.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class addNewSpanishPageTests: XCTestCase {
    
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
   }
   
   override func tearDownWithError() throws {
       app.terminate()
       try super.tearDownWithError()
   }

   func testAddNewSpanishPage() throws {
       
       let pages = Pages(app: app)
       let vocabularyName = "copied vocabulary add new SpanishPage"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //skip the register modal
       pages.skipRegisterModal()
       
       //add languages & region
       pages.openLanguagesRegionSection()
       pages.addLanguage(language: "Spanish (United States)")
       app.buttons["Done"].tap()
       
       //copy a new vocab
       mainPage.copySpanish1Hit(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary add new SpanishPage"], vocab: vocabularyName)
       
       //open the Edit Page Layout tab
       pages.editPage()
       
       //add a new Page
       pages.addNewPage()
       
       //set a name for the new page
       pages.nameForPage(pageName: "Page Test by e2e")
       
       //select spanish page type
       pages.selectSpanishPageType()
              
       //set the background Color and select an image
       pages.addBackgroundColorAndImage()
       
       //clear the image
       pages.clearImageNewPage()
       
       //check if the action works as expected
       pages.checkIfThePageActionWorks()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Add New Spanish Page Test Finished with success!")
       
    }
}
