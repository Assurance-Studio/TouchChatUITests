//  checkAcapaleVoicesTests.swift
//  TouchChatAppUITests
//
//  Created by Alin Voinescu on 11.03.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.

import XCTest

final class checkAcapaleVoicesTests: XCTestCase {

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

   func testAcapelaVoices() throws {
       
       let pages = Pages(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let languagesPage = LanguagesRegionPage(app: app)
       let commonActions = CommonActions(app: app)
       let vocabularyName = "copied vocabulary acapela voices"
       let vocabularyDesc = "vocabulary description e2e"
       let vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //add languages&region
       languagesPage.openLanguagesRegionSection()
       //add arabic language
       languagesPage.addLanguage(language: "Arabic")
       //add chinese language
       languagesPage.addLanguage(language: "Chinese")
       //add french (canada) language
       languagesPage.addLanguage(language: "French (Canada)")
       app.buttons["Done"].tap()
       
       //copy a new vocab
       mainPage.nameVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
       
       //enable rename vocab option
       commonActions.openTheSettingsTab()
       commonActions.ensureAllowDeleteIsOn()
       
       //check if the force font size works
       commonActions.openTheSettingsTab()
       
       //change the voice for English Voice
       languagesPage.changeEnglishVoice()
       
       //change the voice for Arabic Voice
       languagesPage.checkArabicVoice()
       
       //try to select another Acapela Voice
       languagesPage.trySelectAcapelaVoice()
              
       commonActions.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Acapela Voices Test Finished with success!")
    }
}
