//
//  applyGrammarStateTests.swift
//  TouchChatUITests
//
//  Created by Alin V on 14.01.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class applyGrammarStateTests: XCTestCase {

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

   func testGrammarStateAction() throws {
       
       let pages = Pages(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let grammarActionsPage = GrammarActionaPageClass(app: app)
       let vocabularyName = "copied vocabulary grammar action"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       sleep(2)
       mainPage.openVocab(vocab: vocabularyName)
        
       //enable delete vocab option
       pages.openTheSettingsTab()
       pages.ensureAllowDeleteIsOn()
       
       pages.editPage()
       
       //add Apply Grammar Property action - verb
       grammarActionsPage.addSubActionGrammarProperty(ActionName: "Apply Grammar Property", buttonPosition: 24, buttonName: "open", subActionName: "verb")
       
       //add Apply Grammar Property action - adjective
       grammarActionsPage.addSubActionGrammarProperty(ActionName: "Apply Grammar Property", buttonPosition: 23, buttonName: "sweet", subActionName: "adjective")
       
       //add Apply Grammar Property action - noun
       grammarActionsPage.addSubActionGrammarProperty(ActionName: "Apply Grammar Property", buttonPosition: 22, buttonName: "player", subActionName: "noun")
       
       //add Apply Grammar State actions
       actionsPage.editButtonForAction(nameButton: "Grammar State -ed")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add apply grammar action -ed
       actionsPage.addANewAction(actionName: "Apply Grammar State")
       grammarActionsPage.addActionED()
       
       //add apply grammar state action -en
       grammarActionsPage.addSubAction(ActionName: "Apply Grammar State", buttonPosition: 26, buttonName: "Grammar State -en", subActionName: "add -en")
       
       //add apply grammar state action -er
       grammarActionsPage.addSubAction(ActionName: "Apply Grammar State", buttonPosition: 27, buttonName: "Grammar State -er", subActionName: "add -er")
       
       //add grammar state action -est
       grammarActionsPage.addSubAction(ActionName: "Apply Grammar State", buttonPosition: 28, buttonName: "Grammar State -est", subActionName: "add -est")
       
       //add grammar state action -ing
       grammarActionsPage.addSubAction(ActionName: "Apply Grammar State", buttonPosition: 29, buttonName: "Grammar State -ing", subActionName: "add -ing")
       
       //add grammar state action -ly
       grammarActionsPage.addSubAction(ActionName: "Apply Grammar State", buttonPosition: 30, buttonName: "Grammar State -ly", subActionName: "add -ly")
       
       //add grammar state action -s
       grammarActionsPage.addSubAction(ActionName: "Apply Grammar State", buttonPosition: 31, buttonName: "Grammar State -s", subActionName: "add -s")
       
       grammarActionsPage.doneBtn.tap()
       
       //open The Settings Menu
       profilesAndEditingPage.openTheSettingsTab()
       
       //set on the Dynamic Labels Toggle
       grammarActionsPage.setOnDynamicLabels()
       
       grammarActionsPage.checkTheDynamicLabelsToggle()
       
       //Check if the actions work as expected
       grammarActionsPage.checkIfTheActionsWorkAsExpected()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Apply Grammar State & Property Actions Test Finished with success!")
        
    }
}
