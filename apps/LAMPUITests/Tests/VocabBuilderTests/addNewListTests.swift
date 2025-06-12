//  addNewListTests.swift
//  LAMPUITests
//  Created by Alin V on 29.11.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class addNewListTests: XCTestCase {

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

   func testAddNewList() throws {
       
       let pages = Pages(app: app)
       let vocabBuilder = VocabBuilder(app: app)
       let vocabularyName = "copied vocabulary add new list"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //skip the register modal
       pages.skipRegisterModal()
       
       app.staticTexts["English"].firstMatch.tap()
       //copy a new vocab
       mainPage.copyLampWflHit(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary add new list"], vocab: vocabularyName)
       
       //open the Vocab Builder tab
       vocabBuilder.openVocabBuilder()
       
       //save the list
       vocabBuilder.saveTheNewList()
       
       //check if the list was saved
       vocabBuilder.checkIfTheListWasSaved()
              
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Add new list Vocab Builder Page Test Finished with success!")
    }
}
