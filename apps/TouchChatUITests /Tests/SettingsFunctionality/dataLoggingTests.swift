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
    
    func testDataLoggingTests() throws {
        let vocabularyName = "copied vocabulary data logging"
        let vocabularyDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        let pages = Pages(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let dataLoginPage = DataLoggingPage(app: app)
        let commonActions = CommonActions(app: app)
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        
        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open The Settings Menu
        commonActions.openTheSettingsTab()
        
        //check if the enable Logging image appears
        dataLoginPage.checkLoggingImage()
        
        //set privacy password and clear log
        dataLoginPage.setPrivacyPass()
        
        //remove the privacy password
        profilesAndEditingPage.openTheSettingsTab()
        dataLoginPage.removePrivacyPass()
                        
        commonActions.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Data Logging Test Finished with success!")
        
        app.terminate()
        
    }
}
