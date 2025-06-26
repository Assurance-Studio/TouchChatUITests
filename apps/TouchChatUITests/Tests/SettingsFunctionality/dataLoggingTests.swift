//  TouchChatUITests
//
//  Created by Alin Voinescu on 27.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.


import XCTest

final class dataLoggingTests: XCTestCase {

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
    
    func testDataLoggingTests() throws {
        let vocabularyName = "copied vocabulary data logging"
        let vocabylaryDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        let pages = Pages(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let dataLoginPage = DataLoggingPage(app: app)
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        sleep(3)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary data logging"], vocab: vocabularyName)
        
        //enable rename vocab option
<<<<<<< HEAD:Tests/SettingsFunctionality/dataLoggingTests.swift
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
=======
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.ensureAllowDeleteIsOn()
>>>>>>> ip_june2025:apps/TouchChatUITests/Tests/SettingsFunctionality/dataLoggingTests.swift
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //check if the enable Logging image appears
        dataLoginPage.checkLoggingImage()
        
        //set privacy password and clear log
        dataLoginPage.setPrivacyPass()
        
        //remove the privacy password
        profilesAndEditingPage.openTheSettingsTab()
        dataLoginPage.removePrivacyPass()
                        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Data Logging Test Finished with success!")
        
        app.terminate()
        
    }
}
