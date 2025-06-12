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

   func testEditRenameACopiedVocab() throws {
       
       let pages = Pages(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let vocabularyName = "copied vocabulary edit/rename"
       let vocabularyDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copyVocabPC(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary edit/rename"], vocab: vocabularyName)
       
       //enable rename vocab option
       profilesAndEditingPage.openTheSettingsTab()
       profilesAndEditingPage.ensureAllowDeleteIsOn()
       
       pages.backToVocab()
       //rename the copied vocab
       pages.renameACopiedVocab()
       
       //check if the vocab was renamed
       
       XCTAssertTrue(app.staticTexts["Renamed description e2e"].exists, "The renamed vocab is not visible")
       
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       print("Rename & Delete a Copied Vocab Test Finished with success!")
    }
}
