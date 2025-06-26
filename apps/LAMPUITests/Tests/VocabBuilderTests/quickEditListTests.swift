//  quickEditListTests.swift
//  LAMPUITests
//  Created by Alin V on 02.12.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class quickEditListTests: XCTestCase {

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

   func testQuickEditList() throws {
       
       let pages = Pages(app: app)
       let vocabBuilder = VocabBuilder(app: app)
       let vocabularyName = "copied vocabulary quick edit list"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       
       //skip the register modal
       pages.skipRegisterModal()
       
       app.staticTexts["English"].firstMatch.tap()
       //copy a new vocab
       mainPage.copyLampWflFull(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary quick edit list"], vocab: vocabularyName)
       
       //open the Vocab Builder tab
       vocabBuilder.openVocabBuilder()
       
       //open quick edit tab and enter an incorrect word
       vocabBuilder.quickEditBtn.tap()
       vocabBuilder.enterAnIncorrectWord()
       
       //add a correct word & a correct phrase
       vocabBuilder.enterACorrectWordPhrase()
//       XCUIApplication().popovers.scrollViews.otherElements.containing(.staticText, identifier:"Word or Phrase").children(matching: .button).element(boundBy: 3).tap()
       
       
       //edit the list and check if we are able to delete the word
       vocabBuilder.editListAndCheckTheOptions()
       
//       app.searchFields["Search"].tap()
//       app.searchFields["Search"].typeText("there")
       //enable the vocab
       app.switches.element(boundBy: 0).tap()
       
       //enable and check if the changes work
       vocabBuilder.enableChangesAndCheckHowItWork()
       
       //disable all and check if the changes work
       vocabBuilder.openVocabBuilder()
       vocabBuilder.disableAllWordsAndCheckHowItWork()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Quick Edit list Vocab Builder Page Test Finished with success!")
    }
}
