//  createButtonActions4.swift
//  TouchChatAppUITests
//  Created by Alin V on 08.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class createButtonActions: XCTestCase {

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

   func testCreateButtonActions4() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let grammarActionsPage = GrammarActionaPageClass(app: app)
       let vocabularyName = "copied vocabulary create button actions4"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary create button actions4"], vocab: vocabularyName)
       
       //add a new action
       pages.editPage()
       
       //add an action - Add Message To Display
       pages.removeAButton(button: 23)
       pages.createButtonForActions(button: 23, nameButton: "Google Website Toggle On")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add website with restricted toggle turned on
       actionsPage.addANewAction(actionName: "Open Website")
       actionsPage.addWebsiteToggleOn()
       
       //add website with restricted toggle turned off
       grammarActionsPage.addWebsiteRestrictedToggleOff()
       
       //check if the Google website works as expected - Toggle On
       actionsPage.checkTheWebsiteToggleOn()
       
       //check if the Google website works as expected - Toggle Off
       actionsPage.checkTheWebsiteToggleOff()
       
       //open edit page tab
       pages.editPage()
       //add a new action
       pages.removeAButton(button: 28)
       pages.createButtonForActions(button: 28, nameButton: "Pause/Resume Tracking")
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Pause/Resume Tracking")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       app.buttons["Pause/Resume Tracking"].tap()
       
       //add a new action
       pages.editPage()
       
       //add an action - BackSpace Key
       pages.removeAButton(button: 29)
       pages.createButtonForActions(button: 29, nameButton: "Text Copy Button")
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add a new action "Text Copy"
       actionsPage.addANewAction(actionName: "Text Copy")
       
       //save the action
       actionsPage.editTextPasteBtn()
       actionsPage.removeSpeechMessageAction()
       actionsPage.addANewAction(actionName: "Text Paste")
       actionsPage.saveTheAction()
       
       //check if the actions work as expected
       actionsPage.checkTextPasteCopyFunctions()
       
       pages.checkSdbText(sdbText: "Endtoend ")
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 25)
       pages.createButtonForActions(button: 25, nameButton: "Visit Exception")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Visit Exception")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       app.buttons["Visit Exception"].tap()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Create button actions4 Test Finished with success!")
    }
}
