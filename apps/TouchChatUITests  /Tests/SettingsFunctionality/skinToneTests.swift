//
//  skinToneTests.swift
//  TouchChatAppUITests
//
//  Created by Alin V on 24.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class skinToneTests: XCTestCase {

    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        commonActions.checkLicenseModal()
        commonActions.checkStartModal()
        commonActions.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
   }
   
   override func tearDownWithError() throws {
       app.terminate()
       try super.tearDownWithError()
   }

   func testSkinTone() throws {
       
       let pages = Pages(app: app)
       let commonActions = CommonActions(app: app)
       let vocabularyName = "copied vocabulary skin tone settings"
       let vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       pages.sintaxis4x5English.tap()
       app.buttons["Customize"].tap()
       let copyVocabTab = app.staticTexts["Copy Vocab"]
       let copyVocabExists = copyVocabTab.waitForExistence(timeout: 10)
       XCTAssertTrue(copyVocabExists)
       app.textFields.element(boundBy: 0).tap()
       app.buttons["Clear text"].tap()
       app.textFields.element(boundBy: 0).typeText(vocabularyName)
       app.buttons["Save"].tap()
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary skin tone settings"], vocab: vocabularyName)
       
       pages.verifyTheVocab(lastElement: "Transportation", vocabWord: "Toys", vocabElement: 3, nameElement: "People")
       
       //enable rename vocab option
       commonActions.openTheSettingsTab()
       commonActions.ensureAllowDeleteIsOn()
       
       //clear all predictions
       app.buttons["Menu"].tap()
       let vocabSettingsButton = app.buttons["Vocabulary Settings"]
       let vocabSettingsButtonExists = vocabSettingsButton.waitForExistence(timeout: 7)
       XCTAssertTrue(vocabSettingsButtonExists)
       vocabSettingsButton.tap()
       
       app.staticTexts["SymbolStix Skin Tone"].tap()
       let randomBtn = app.staticTexts["Random"]
       let randomBtnExists = randomBtn.waitForExistence(timeout: 10)
       XCTAssertTrue(randomBtnExists)
       randomBtn.tap()
       app.buttons["Done"].tap()
       app.buttons["Back"].tap()
       
       commonActions.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Skin Tone Test Finished with success!")
    }
}
