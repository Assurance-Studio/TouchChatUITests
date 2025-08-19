//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class copyPasteButtonFunctionalitieTests: XCTestCase {
    
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

    func testcopyPasteButtonFunctionalitiesTests() throws {
        
        let pages = Pages(app: app)
        let vocabularyName = "copied vocabulary edit button"
        let vocabularyDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copyVocabPC(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        mainPage.openVocab(vocab: vocabularyName)

        //enable delete vocab option
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
        
        //open the Edit Page tab
        pages.editPage()
        
        //copy an existing butto
        pages.copyAButton(buttonName: "I want")
        
        //paste the button
        pages.pasteTheButton()
        
        pages.checkSdbText(sdbText: "I want a drink ")
        
        app.buttons["Back"].tap()
        
        pages.editPage()
        
        //use the same button
        pages.useTheSameButton()
        
        pages.checkSdbText(sdbText: "I want a drink I want a snack ")
        
        app.buttons["Back"].tap()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Copy & Paste Button Test Finished with success!")
    }
}
