//  openVocabBuilderTests.swift
//  LAMPUITests
//  Created by Alin V on 25.11.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class openVocabBuilderTests: XCTestCase {

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

   func testOpenVocabBuilder() throws {
       
       let pages = Pages(app: app)
       let vocabBuilder = VocabBuilder(app: app)
       let vocabularyName = "copied vocabulary vocab builder"
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
       mainPage.openVocab(vocab: vocabularyName)
       
       //open the Vocab Builder tab
       vocabBuilder.openVocabBuilder()
       
       //check tha available words
       vocabBuilder.checkAvailableWords()

       //check the search function
       vocabBuilder.searchForAWord()

       //check the File List tab
       vocabBuilder.checkFileListTab()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Open Vocab Builder Page Test Finished with success!")
       
    }
}
