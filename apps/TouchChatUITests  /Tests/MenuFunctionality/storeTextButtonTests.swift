//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class storeTextButtonTests: XCTestCase {
    
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

    func testLaunchStoreTextButton() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        let vocabularyName = "copied vocabulary"
        let vocabularyDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a Spelling Vocab
        mainPage.nameVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        
        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //storeTextToAButton
        commonActions.writeTestBy()
        commonActions.openStoreTextBtn()
        
        //check if the storeTextButton is displayed
        commonActions.checkIfTheStoreButtonWorks()
        
        //check if the word appears
        commonActions.checkSdbText(sdbText: "TestbyTestby ")
        commonActions.backToVocab();
        
        //delete the copied vocab
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Store Text Button function Test Finished with success!")
        
        app.terminate()
        
    }
}
