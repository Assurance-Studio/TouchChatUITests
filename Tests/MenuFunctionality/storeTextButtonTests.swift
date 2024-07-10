//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class storeTextButtonTests: XCTestCase {
    
   
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

    func testLaunchStoreTextButton() throws {
        
        let pages = Pages(app: app)
        let vocabularyName = "copied vocabulary"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        pages.scrollDownUntilElementIsVisible(element: pages.spellingSS)
        
        //copy a Spelling Vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary"], vocab: vocabularyName)
        
        //storeTextToAButton
        pages.writeTestBy()
        pages.openStoreTextBtn()
        
        //check if the storeTextButton is displayed
        pages.checkIfTheStoreButtonWorks()
        
        //check if the word appears
        pages.checkSdbText(sdbText: "TestbyTestby ")
        pages.backToVocab();
        
        //delete the copied vocab
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Store Text Button function Test Finished with success!")
        
        app.terminate()
        
    }
}





































