//
//  pasteButtonStyle.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 08.10.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class pasteButtonStyle: XCTestCase {

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

   func testPasteButtonStyleTests() throws {
       
       let pages = Pages(app: app)
       let commonActions = CommonActions(app: app)
       let vocabularyName = "copied vocabulary paste button"
       let vocabularyDesc = "vocabulary description e2e"
       let vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.nameVocabPC(vocabName: vocabularyName, vocabDescription: vocabularyDesc)

       //enable rename vocab option
       commonActions.openTheSettingsTab()
       commonActions.ensureAllowDeleteIsOn()
       
       //open the Edit Page tab
       pages.editPage()
       
       //open the Edit This button tab and fill in the button label&pronunciation
       pages.editThisButton()
       
       //select image
       pages.selectImageButton()
       //turn off switches
       pages.editAButtonForButtonStyle()
       
       //copy the button style
       pages.copyPasteButtonStyle()
       
       //check if the paste button style works as expected
       pages.checkIfTheButtonStyleWasCopied()
       
       commonActions.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
    }
}
