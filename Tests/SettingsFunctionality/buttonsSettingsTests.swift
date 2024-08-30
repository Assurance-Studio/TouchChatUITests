//
//  buttonsSettingsTests.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 29.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class buttonsSettingsTests: XCTestCase {

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

   func testButtonSettings() throws {
       
       let pages = Pages(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let buttonsSettingsPage = ButtonsSettingsPage(app: app)
       pages.scrollDownUntilElementIsVisible(element: pages.spellingSS)
       let vocabularyName = "copied vocabulary buttons settings"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary buttons settings"], vocab: vocabularyName)

       pages.editPage()
       //edit the font size for a button
       buttonsSettingsPage.editFontSizeButton()
       
       //hide a button
       pages.hideAButton()
       
       //check if the force font size works
       profilesAndEditingPage.openTheSettingsTab()
       buttonsSettingsPage.checkTheForceFontSize()
       
       //check if the hide button appears
       buttonsSettingsPage.checkHideButtons()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Button Settings Test Finished with success!")
   }
}
