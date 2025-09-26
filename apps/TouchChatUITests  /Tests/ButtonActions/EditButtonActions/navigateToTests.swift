//
//  navigateToTests.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 04.10.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class navigateToTests: XCTestCase {

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

   func testAddMessageDisplayTests() throws {
       
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
       
       pages.editPage()
       //add an action
       actionsPage.editButtonForAction(nameButton: "Navigate to Page No Anim")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add no animation action
       actionsPage.addANewAction(actionName: "Navigate")
       actionsPage.addNoAnimAction()
       
       //add navigation - up
       grammarActionsPage.addNavigateAction(button: 26, navigateDirection: "Navigate to Page Up", directionType: "  Animate Up")
       
       //add navigation - down
       grammarActionsPage.addNavigateAction(button: 27, navigateDirection: "Navigate to Page Down", directionType: "  Animate Down")
       
       //add navigation - right
       grammarActionsPage.addNavigateAction(button: 28, navigateDirection: "Navigate to Page Right", directionType: "  Animate Right")
       
       //add navigation - left
       grammarActionsPage.addNavigateAction(button: 29, navigateDirection: "Navigate to Page Left", directionType: "  Animate Left")
       
       //check if the action works
       actionsPage.checkNavigateActions()
       
       commonActions.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Navigate to Page Test Finished with success!")
    }
}
