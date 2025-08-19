//  addNewFrenchPageTests.swift
//  LAMPUITests
//  Created by Alin V on 22.11.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class addNewFrenchPageTests: XCTestCase {

    var app = XCUIApplication()
    var pages: Pages!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        let pages = Pages(app: app)
        pages.checkLicenseModal()
        pages.checkStartModal()
        pages.clickWelcomeX()
   }
   
   override func tearDownWithError() throws {
       app.terminate()
       try super.tearDownWithError()
   }

   func testAddNewFrenchPage() throws {
       
       let pages = Pages(app: app)
       let vocabularyName = "copied vocabulary add new FrenchPage"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //skip the register modal
       pages.skipRegisterModal()
       
       //add languages & region
       pages.openLanguagesRegionSection()
       pages.addLanguage(language: "French (Canada)")
       app.buttons["Done"].tap()
       
       //copy a new vocab
       mainPage.copyFrench1Hit(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocab: vocabularyName)
       
       //open the Edit Page Layout tab
       pages.editPage()
       
       //add a new Page
       pages.addNewPage()
       
       //set a name for the new page
       pages.nameForPage(pageName: "Page Test by e2e")
       
       //select french page type
       pages.selectFrenchPageType()
       
       //set the background Color and select an image
       pages.addBackgroundColorSetImagePage()
       
       //clear the image
       pages.clearImageNewPage()
       
       //check if the action works as expected
       pages.checkIfThePageActionWorks()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Add New French Page Test Finished with success!")
       
    }
}
