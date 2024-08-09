//  TouchChatUITests
//
//  Created by Marius N on 06.06.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//  This test should test the copy a vocabulary functionality.

import XCTest

final class copyVocabularyTests: XCTestCase {
    
    var app = XCUIApplication()
    //var app: XCUIApplication
    
    let vocabularyName = "copied vocabulary test"
    let vocabylaryDesc = "vocabulary description e2e"
    var vocabName = "vocabulary"
    lazy var mainPage: MainPage = {
        return MainPage(app: XCUIApplication(), vocabName: vocabName)
    }()
    let pages = Pages(app: XCUIApplication())
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app.launch()
        pages.clearAppCache()
        pages.resetPersistentStorage()
        pages.reachMenuPageIfOnVocabPage()
        pages.deleteVocabFromVocabPageIfExisting(deleteCircle: vocabylaryDesc, maxScrolls: 3, timeout: 5)
        pages.scrollUpUntilElementIsVisible(element: mainPage.cancelSearchButton)
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }
    
    func testCopyVocabulary() {
        mainPage.copy4BasicSS(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.verifyTextExists(textVerified: vocabylaryDesc)
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabylaryDesc)
    }
}
