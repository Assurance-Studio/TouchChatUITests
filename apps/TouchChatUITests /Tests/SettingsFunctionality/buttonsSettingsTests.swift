//  buttonsSettingsTests.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 29.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.


import XCTest

final class buttonsSettingsTests: XCTestCase {

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

   func testButtonSettings() throws {
       
       let pages = Pages(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let buttonsSettingsPage = ButtonsSettingsPage(app: app)
       let commonActions = CommonActions(app: app)
       let vocabularyName = "copied vocabulary buttons settings"
       let vocabularyDesc = "vocabulary description e2e"
       let vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.nameVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)

       //enable rename vocab option
       commonActions.openTheSettingsTab()
       commonActions.ensureAllowDeleteIsOn()
       
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
       
       commonActions.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Button Settings Test Finished with success!")
   }
}
