//
//  createButtonActions4.swift
//  TouchChatAppUITests
//
//  Created by Alin V on 03.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class createButtonActions4: XCTestCase {

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

   func testCreateButtonGrammarActions() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let grammarActionsPage = GrammarActionaPageClass(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let vocabularyName = "copied vocabulary create button grammar actions"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary create button grammar actions"], vocab: vocabularyName)

       //enable delete vocab option
       profilesAndEditingPage.openTheSettingsTab()
       profilesAndEditingPage.ensureAllowDeleteIsOn()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 24)
       pages.createButtonForActions(button: 24, nameButton: "Grammar Action -ed")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add grammar action -ed
       actionsPage.addANewAction(actionName: "Grammar Action")
       grammarActionsPage.addActionED()
       
       //add grammar action -en
       pages.removeAButton(button: 26)
       grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -en", actionType: "add -en", buttonNumber: 26)
       
       //add grammar action -er
       pages.removeAButton(button: 27)
       grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -er", actionType: "add -er", buttonNumber: 27)
       
       //add grammar action -est
       pages.removeAButton(button: 28)
       grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -est", actionType: "add -est", buttonNumber: 28)
       
       //add grammar action -ing
       pages.removeAButton(button: 29)
       grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -ing", actionType: "add -ing", buttonNumber: 29)
       
       //add grammar action -ly
       pages.removeAButton(button: 30)
       grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -ly", actionType: "add -ly", buttonNumber: 30)
       
       //add grammar -s
       pages.removeAButton(button: 31)
       grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -s", actionType: "add -s", buttonNumber: 31)
       
       //create a new button
       grammarActionsPage.createAVerb()
       
       //app.buttons["z"].tap()
       grammarActionsPage.createAnAdjective()
       
       //check if the grammar action works as expected
       grammarActionsPage.checkGrammarAction()
       
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Create button Grammar Actions Test Finished with success!")
    }
}
