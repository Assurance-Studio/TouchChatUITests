//  createButtonActions2.swift
//  TouchChatAppUITests
//  Created by Alin V on 03.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class createButtonActions2: XCTestCase {

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

   func testCreateButtonActions2() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let vocabularyName = "copied vocabulary create button actions2"
       let vocabylaryDesc = "vocabulary description e2e"
       let vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary create button actions2"], vocab: vocabularyName)
       
       //enable delete vocab option
<<<<<<< HEAD:Tests/ButtonActions/CreateButtonActions/createButtonActions2.swift
       pages.openTheSettingsTab()
       pages.ensureAllowDeleteIsOn()
=======
       profilesAndEditingPage.openTheSettingsTab()
       profilesAndEditingPage.ensureAllowDeleteIsOn()
>>>>>>> ip_june2025:apps/TouchChatUITests/Tests/ButtonActions/CreateButtonActions/createButtonActions2.swift
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 28)
       pages.createButtonForActions(button: 28, nameButton: "Clear Last Word")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Clear Last Word")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       actionsPage.clearLastWord()
       app.buttons["CLEAR "].tap()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 29)
       pages.createButtonForActions(button: 29, nameButton: "Calculator")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Calculator")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       actionsPage.checkTheCalculatorAction()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 30)
       pages.createButtonForActions(button: 30, nameButton: "Help Signal")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Help Signal")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       app.buttons["Help Signal"].tap()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 31)
       pages.createButtonForActions(button: 31, nameButton: "Play YouTube Video")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add no animation action
       actionsPage.addANewAction(actionName: "Play Video")
       
       //check Library Video tab
       actionsPage.checkLibraryVideoTab()
       
       //check youtube video tab and insert a video
       actionsPage.checkYoutubeVideoTab()
       
       //check if the action works as expected
       actionsPage.checkYoutubeVideoBtn()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 42)
       pages.createButtonForActions(button: 42, nameButton: "Add Action Date")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Add Time/Date")
       actionsPage.addActionForTimeDate(actionType: "Date Only")
       
       //check if the action works
       actionsPage.checkIfTheDateisDisplayed()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Create button actions2 Test Finished with success!")
    }
}
