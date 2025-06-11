//
//  batteryStatusTests.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 27.09.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class batteryStatusTests: XCTestCase {

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

   func testBatteryStatus() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let vocabularyName = "copied vocabulary battery status"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       sleep(2)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary battery status"], vocab: vocabularyName)

       //enable delete vocab option
       profilesAndEditingPage.openTheSettingsTab()
       profilesAndEditingPage.ensureAllowDeleteIsOn()
       
       pages.editPage()
       //add an action
       actionsPage.editButtonForAction(nameButton: "Battery Sts")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Battery Status")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       actionsPage.checkTheBatteryStatus()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Battery Status Action Test Finished with success!")
    }
}
