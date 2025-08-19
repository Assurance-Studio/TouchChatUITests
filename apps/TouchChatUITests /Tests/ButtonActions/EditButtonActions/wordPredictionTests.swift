//  wordPredictionTests.swift
//  TouchChatAppUITests
//  Created by Alin Voinescu on 18.02.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class wordPredictionTests: XCTestCase {

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

   func testWordPrediction() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let grammarActionsPage = GrammarActionaPageClass(app: app)
       let vocabularyName = "copied vocabulary wordprediction"
       let vocabylaryDesc = "vocabulary description e2e"
       let vocabName = "vocabulary"
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
       //add an action
       actionsPage.editButtonForAction(nameButton: "Word Prediction Btn 1")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add a new action "Text Copy"
       actionsPage.addANewAction(actionName: "Word Prediction")
       app.staticTexts["  Number 1"].tap()
       app.buttons["Save"].tap()
       //check the Word Finder action
       grammarActionsPage.addNavigateActionsHomeBack(button: 26, navigateDirection: "Word Prediction Btn 2", actionType: "Word Prediction", directionType: "  Number 2")
       //add no3
       grammarActionsPage.addNavigateActionsHomeBack(button: 27, navigateDirection: "Word Prediction Btn 3", actionType: "Word Prediction", directionType: "  Number 3")
       //add no4
       grammarActionsPage.addNavigateActionsHomeBack(button: 28, navigateDirection: "Word Prediction Btn 4", actionType: "Word Prediction", directionType: "  Number 4")
       //add no5
       grammarActionsPage.addNavigateActionsHomeBack(button: 22, navigateDirection: "Word Prediction Btn 5", actionType: "Word Prediction", directionType: "  Number 5")
       //add no6
       grammarActionsPage.addNavigateActionsHomeBack(button: 23, navigateDirection: "Word Prediction Btn 6", actionType: "Word Prediction", directionType: "  Number 6")
       //add no7
       grammarActionsPage.addNavigateActionsHomeBack(button: 24, navigateDirection: "Word Prediction Btn 7", actionType: "Word Prediction", directionType: "  Number 7")
       //add no8
       grammarActionsPage.addNavigateActionsHomeBack(button: 29, navigateDirection: "Word Prediction Btn 8", actionType: "Word Prediction", directionType: "  Number 8")
       //add no9
       grammarActionsPage.addNavigateActionsHomeBack(button: 30, navigateDirection: "Word Prediction Btn 9", actionType: "Word Prediction", directionType: "  Number 9")
       //add no10
       grammarActionsPage.addNavigateActionsHomeBack(button: 31, navigateDirection: "Word Prediction Btn 10", actionType: "Word Prediction", directionType: "  Number 10")
       
       actionsPage.checkWordPredictionsAction()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Word Prediction Test Finished with success!")
    }
}
