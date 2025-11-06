//
//  navigateHomeBackTests.swift
//  TouchChatUITests
//
//  Created by Alin V on 20.01.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class navigateHomeBackTests: XCTestCase {

    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        commonActions.checkLicenseModal()
        commonActions.checkStartModal()
        commonActions.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
   }
   
   override func tearDownWithError() throws {
       app.terminate()
       try super.tearDownWithError()
   }

   func testNavigateHomeBackTests() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let grammarActionsPage = GrammarActionaPageClass(app: app)
       let commonActions = CommonActions(app: app)
       let vocabularyName = "copied vocabulary navigate to"
       let vocabularyDesc = "vocabulary description e2e"
       let vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.nameVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
       
       //enable delete vocab option
       commonActions.openTheSettingsTab()
       commonActions.ensureAllowDeleteIsOn()
       
       grammarActionsPage.openSecondPage()

       pages.editPage()
       //add an action
       actionsPage.editButtonForNavigateAction(nameButton: "Navigate Back No Anim")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add no animation action
       actionsPage.addANewAction(actionName: "Navigate Back")
       grammarActionsPage.addNoAnimNavigateHomeBack()
       
       grammarActionsPage.addNavigateActionsHomeBack(button: 8, navigateDirection: "Navigate Back Animate Up", actionType: "Navigate Back", directionType: "  Animate Up")
       
       grammarActionsPage.addNavigateActionsHomeBack(button: 9, navigateDirection: "Navigate Back Animate Down", actionType: "Navigate Back", directionType: "  Animate Down")
       
       grammarActionsPage.addNavigateActionsHomeBack(button: 10, navigateDirection: "Navigate Back Animate Right", actionType: "Navigate Back", directionType: "  Animate Right")
       
       grammarActionsPage.addNavigateActionsHomeBack(button: 11, navigateDirection: "Navigate Back Animate Left", actionType: "Navigate Back", directionType: "  Animate Left")
       
       grammarActionsPage.addNavigateActionsHomeBack(button: 12, navigateDirection: "Navigate To Home No Anim", actionType: "Navigate To Home", directionType: "  No Animation")
       
       grammarActionsPage.addNavigateActionsHomeBack(button: 13, navigateDirection: "Navigate To Home Animate Up", actionType: "Navigate To Home", directionType: "  Animate Up")
       
       grammarActionsPage.addNavigateActionsHomeBack(button: 14, navigateDirection: "Navigate To Home Animate Down", actionType: "Navigate To Home", directionType: "  Animate Down")
       
       grammarActionsPage.addNavigateActionsHomeBack(button: 15, navigateDirection: "Navigate To Home Animate Right", actionType: "Navigate To Home", directionType: "  Animate Right")
       
       grammarActionsPage.addNavigateActionsHomeBack(button: 16, navigateDirection: "Navigate To Home Animate Left", actionType: "Navigate To Home", directionType: "  Animate Left")
       
       
       grammarActionsPage.checkNavigateHomeBackActions()
       
       commonActions.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Navigate Home/Back Test Finished with success!")
    }
}
