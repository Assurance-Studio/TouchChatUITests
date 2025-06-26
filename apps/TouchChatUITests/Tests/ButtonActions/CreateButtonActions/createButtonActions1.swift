//  createButtonActions1.swift
//  TouchChatAppUITests
//  Created by Alin V on 31.03.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class createButtonActions1: XCTestCase {

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

   func testCreateButtonActions() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let vocabularyName = "copied vocabulary create button actions1"
       let vocabylaryDesc = "vocabulary description e2e"
       let vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary create button actions1"], vocab: vocabularyName)

       //enable delete vocab option
<<<<<<< HEAD:Tests/ButtonActions/CreateButtonActions/createButtonActions1.swift
       pages.openTheSettingsTab()
       pages.ensureAllowDeleteIsOn()
=======
       profilesAndEditingPage.openTheSettingsTab()
       profilesAndEditingPage.ensureAllowDeleteIsOn()
>>>>>>> ip_june2025:apps/TouchChatUITests/Tests/ButtonActions/CreateButtonActions/createButtonActions1.swift
       
       pages.editPage()
       //add an action - Add Time/Date
       pages.removeAButton(button: 22)
       pages.createButtonForActions(button: 22, nameButton: "Add Action Time/Date")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time action
       actionsPage.addANewAction(actionName: "Add Time/Date")
       actionsPage.addActionForTimeDate(actionType: "Date and Time")
       
       //check if the action works as expected
       actionsPage.checkIfTheDateTimeAreDisplayed()
       app.buttons["CLEAR "].tap()
       
       //add a new action
       pages.editPage()
       
       //add an action - Add Message To Display
       pages.removeAButton(button: 24)
       pages.createButtonForActions(button: 24, nameButton: "Add Message To Display")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add message to display
       actionsPage.addANewAction(actionName: "Add Message to Display")
       
       //check if the action works as expected
       actionsPage.checkAddMessageDisplay()
       app.buttons["CLEAR "].tap()
       
       //add a new action
       pages.editPage()
       
       //add an action - BackSpace Key
       pages.removeAButton(button: 25)
       pages.createButtonForActions(button: 25, nameButton: "Backspace Key")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add backspace key action
       actionsPage.addANewAction(actionName: "Backspace Key")
       
       //save the action
       actionsPage.saveTheAction()
       
       //check if the action works as expected
       actionsPage.checkIfTheActionsWorks()
       app.buttons["CLEAR "].tap()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 26)
       pages.createButtonForActions(button: 26, nameButton: "Clear Display")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add clear dipsplay action
       actionsPage.addANewAction(actionName: "Clear Display")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works as expected
       actionsPage.clearDisplay()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 27)
       pages.createButtonForActions(button: 27, nameButton: "Battery Sts")
       
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
       
       print("Create button actions1 Test Finished with success!")
    }
}
