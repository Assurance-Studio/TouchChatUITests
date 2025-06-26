//  TouchChatUITests
//
//  Created by Alin Voinescu on 05.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.


import XCTest

final class pageSizeTests: XCTestCase {
    
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        let vocabularyName = "copied vocabulary"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
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
    
    func testPageSizeTests() throws {
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        let vocabularyName = "copied vocabulary Page Size"
        let vocabylaryDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        let pages = Pages(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary Page Size"], vocab: vocabularyName)
        
        //enable rename vocab option
<<<<<<< HEAD:Tests/SettingsFunctionality/pageSizeTests.swift
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
        
=======
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.ensureAllowDeleteIsOn()
>>>>>>> ip_june2025:apps/TouchChatUITests/Tests/SettingsFunctionality/pageSizeTests.swift
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //turn on the status bar and check if it works
        profilesAndEditingPage.unCheckStatusBar()
        
        //swith to Generic the keyguard inset and check if it works
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.checkKeyguardInset()
                
        //return to initial settings for Page Size Tab
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.returnToInitialSettingsPageSize()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Page Size Tests Test Finished with success!")
        
        app.terminate()
        
    }
}
