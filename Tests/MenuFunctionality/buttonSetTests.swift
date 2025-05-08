//  buttonSetTests.swift
//  TouchChatAppUITests
//  Created by Alin V on 29.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class buttonSetTests: XCTestCase {

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

   func testButtonSet() throws {
       
       let pages = Pages(app: app)
       let vocabularyName = "copied vocabulary ButtonSet"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary ButtonSet"], vocab: vocabularyName)

       //open the Edit Page Layout tab
       pages.editPage()
       
       //remove a buttonSet
       pages.removeAButton(button: 22)
       
       //copy buttonSet
       pages.copyButtonSet()
       
       //paste buttonSet
       pages.pasteButtonSet()
       
       //check if the action works as expected
       pages.checkHowCopyPasteButtonSetWorks()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Remove, Copy, Paste ButtonSet Test Finished with success!")
    }
}
