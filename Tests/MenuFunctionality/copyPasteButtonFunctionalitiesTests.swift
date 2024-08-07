//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class copyPasteButtonFunctionalitieTests: XCTestCase {
    
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
         pages.deleteVocabFromVocabPageIfExisting(deleteCircle: "minus.circle.fill", maxScrolls: 3, timeout: 5)
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testcopyPasteButtonFunctionalitiesTests() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.spellingSS)
        let vocabularyName = "copied vocabulary edit button"
        let vocabularyDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copyVocabPC(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary edit button"], vocab: vocabularyName)

        //open the Edit Page tab
        pages.editPage()
        
        //copy an existing butto
        pages.copyAButton(buttonName: "I want")
        
        //paste the button
        pages.pasteTheButton()
        
        pages.checkSdbText(sdbText: "I want a drink ")
        
        app.buttons["Back"].tap()
        
        pages.editPage()
        
        //use the same button
        pages.useTheSameButton()
        
        pages.checkSdbText(sdbText: "I want a drink I want a snack ")
        
        app.buttons["Back"].tap()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Copy & Paste Button Test Finished with success!")
    }
}
