//
//  editRenameACopiedVocab.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 23.09.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class editRenameACopiedVocab: XCTestCase {

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

   func testEditRenameACopiedVocab() throws {
       
       let pages = Pages(app: app)
       let commonActions = CommonActions(app: app)
       let vocabularyName = "copied vocabulary edit/rename"
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
              
       commonActions.backToVocab()
        //rename the copied vocab
        pages.renameACopiedVocab()
              
        //check if the vocab was renamed
              
        XCTAssertTrue(app.staticTexts["Renamed description e2e"].exists, "The renamed vocab is not visible")
              
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        print("Rename & Delete a Copied Vocab Test Finished with success!")
    }
}
