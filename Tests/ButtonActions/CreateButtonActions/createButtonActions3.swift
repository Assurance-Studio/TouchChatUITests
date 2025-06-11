//  createButtonActions3.swift
//  TouchChatAppUITests
//  Created by Alin V on 03.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class createButtonActions3: XCTestCase {

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

   func testCreateButtonActions3() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let vocabularyName = "copied vocabulary create button actions3"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary create button actions3"], vocab: vocabularyName)
       
       //enable delete vocab option
       profilesAndEditingPage.openTheSettingsTab()
       profilesAndEditingPage.ensureAllowDeleteIsOn()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 43)
       pages.createButtonForActions(button: 43, nameButton: "Add Action Time")
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time action
       actionsPage.addANewAction(actionName: "Add Time/Date")
       
       actionsPage.addActionForTimeDate(actionType: "Time Only")
       
       //check if the action works
       actionsPage.checkIfTheTimeisDisplayed()
       app.buttons["CLEAR "].tap()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 44)
       pages.createButtonForActions(button: 44, nameButton: "Word Finder Btn")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add a new action "Text Copy"
       actionsPage.addANewAction(actionName: "Word Finder")
       actionsPage.saveTheAction()
       //check the Word Finder action
       actionsPage.checkWordFinderAction()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 45)
       pages.createButtonForActions(button: 45, nameButton: "Data Logging")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Data Logging On/Off")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       actionsPage.checkLoggingData()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 46)
       pages.createButtonForActions(button: 46, nameButton: "Cancel Visit Btn")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add no animation action
       actionsPage.addANewAction(actionName: "Cancel Visit")
       
       //save the action
       actionsPage.saveTheAction()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 47)
       pages.createButtonForActions(button: 47, nameButton: "System Keyboard")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "System Keyboard")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       actionsPage.checkSystemKeyboardAction()
       
       pages.editPage()
       
       //edit a button
       pages.removeAButton(button: 48)
       pages.createButtonForActions(button: 48, nameButton: "Navigate to Conversations")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add the action
       actionsPage.addANewAction(actionName: "Texting - Navigate to Conversations")
       actionsPage.saveTheAction()
       
       //check if the action works as expected
       actionsPage.checkIfTheTextingConversationsWorks()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Create button actions3 Test Finished with success!")
    }
}
