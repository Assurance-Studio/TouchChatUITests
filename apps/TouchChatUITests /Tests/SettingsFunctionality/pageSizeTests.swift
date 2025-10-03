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
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
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
    
    func testPageSizeTests() throws {
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        let vocabularyName = "copied vocabulary Page Size"
        let vocabularyDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let commonActions = CommonActions(app: app)
        
        mainPage.nameVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        
        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open The Settings Menu
        commonActions.openTheSettingsTab()
        
        //turn on the status bar and check if it works
        profilesAndEditingPage.unCheckStatusBar()
        
        //swith to Generic the keyguard inset and check if it works
        commonActions.openTheSettingsTab()
        profilesAndEditingPage.checkKeyguardInset()
                
        //return to initial settings for Page Size Tab
        commonActions.openTheSettingsTab()
        profilesAndEditingPage.returnToInitialSettingsPageSize()
        
        commonActions.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Page Size Tests Test Finished with success!")
        
        app.terminate()
        
    }
}
