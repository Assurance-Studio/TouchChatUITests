//  addNewEnglishPageTests.swift
//  LAMPUITests
//
//  Created by Alin V on 21.11.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class addNewEnglishPageTests: XCTestCase {

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

   func testAddNewEnghishPage() throws {
       
       let pages = Pages(app: app)
       let vocabularyName = "copied vocabulary add new EnglishPage"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //skip the register modal
       pages.skipRegisterModal()
       
       //copy a new vocab
       mainPage.lampWFL1Hit.tap()
       app.buttons["Customize"].tap()
       let copyVocabTab = app.staticTexts["Copy Vocab"]
       let copyVocabExists = copyVocabTab.waitForExistence(timeout: 10)
       XCTAssertTrue(copyVocabExists)
       app.textFields.element(boundBy: 0).tap()
       app.buttons["Clear text"].tap()
       app.textFields.element(boundBy: 0).typeText(vocabularyName)
       app.buttons["Save"].tap()
       
       mainPage.openVocab(vocab: vocabularyName)
       
       //open the Edit Page Layout tab
       pages.editPage()
       
       //add a new Page
       pages.addNewPage()
       
       //set a name for the new page
       pages.nameForPage(pageName: "Page Test by e2e")
       
       //set the background Color and select an image
       pages.addBackgroundColorAndImage()
       
       //check the page type
       pages.checkThePageType()
       
       //clear the image
       pages.clearImageNewPage()
       
       //check if the action works as expected
       pages.checkIfThePageActionWorks()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Add New English Page Test Finished with success!")
       
    }
}
