//  TouchChatUITests
//
//  Created by Alin V
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class EditGesturesTests: XCTestCase {
    
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
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testEditGesturesPage() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.spellingSS)
        let vocabularyName = "copied vocabulary gestures"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary gestures"], vocab: vocabularyName)

        pages.editPage()
        pages.addNewGesture()
        pages.verifyGestureExists()
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Edit Gestures Test Finished with success!")
    }
}
