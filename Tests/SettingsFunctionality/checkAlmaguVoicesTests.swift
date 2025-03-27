//
//  checkAlmaguVoicesTests.swift
//  TouchChatAppUITests
//
//  Created by Alin Voinescu on 13.03.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class checkAlmaguVoicesTests: XCTestCase {

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

   func testAlmaguVoices() throws {
       
       let pages = Pages(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let languagesPage = LanguagesRegionPage(app: app)
       let vocabularyName = "copied vocabulary almagu voices"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
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
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary almagu voices"], vocab: vocabularyName)
       
       //check if the force font size works
       profilesAndEditingPage.openTheSettingsTab()
       
       //change the voice for English Voice
       languagesPage.changeEnglishVoiceToAlmaguVoice()
       
       //try to select another Almagu Voice
       languagesPage.trySelectAlmaguVoice()
              
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Almagu Voices Test Finished with success!")
    }
}
