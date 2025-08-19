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

   func testButtonSettings() throws {
       
       let pages = Pages(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let buttonsSettingsPage = ButtonsSettingsPage(app: app)
       let vocabularyName = "copied vocabulary buttons settings"
       let vocabylaryDesc = "vocabulary description e2e"
       let vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocab: vocabularyName)

       //enable rename vocab option
       pages.openTheSettingsTab()
       pages.ensureAllowDeleteIsOn()
       
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
