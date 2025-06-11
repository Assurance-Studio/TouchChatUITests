//
//  clearDisplayTests.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 01.10.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class clearDisplayTests: XCTestCase {

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

   func testClearDisplay() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let vocabularyName = "copied vocabulary clear display"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       sleep(2)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary clear display"], vocab: vocabularyName)

       //enable delete vocab option
       profilesAndEditingPage.openTheSettingsTab()
       profilesAndEditingPage.ensureAllowDeleteIsOn()
       
       pages.editPage()
       //add an action
       actionsPage.editButtonForAction(nameButton: "Clear Display")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Clear Display")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       actionsPage.clearDisplay()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Clear Display Action Test Finished with success!")
    }
}
