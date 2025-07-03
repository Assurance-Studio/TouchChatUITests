//
//  visitToTests.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 07.10.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class visitToTests: XCTestCase {

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

   func testVisitToTests() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let grammarActionsPage = GrammarActionaPageClass(app: app)
       let vocabularyName = "copied vocabulary visit to"
       let vocabylaryDesc = "vocabulary description e2e"
       let vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary visit to"], vocab: vocabularyName)

       //enable delete vocab option
       pages.openTheSettingsTab()
       pages.ensureAllowDeleteIsOn()
       
       pages.editPage()
       //add an action
       actionsPage.editButtonForAction(nameButton: "Visit to Page No Anim")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add no animation action
       actionsPage.addANewAction(actionName: "Visit")
       actionsPage.addNoAnimAction()
       
       //add navigation - up
       grammarActionsPage.addVisitAction(button: 26, jumpDirection: "Visit to Page Up", directionType: "  Animate Up")
       
       //add navigation - down
       grammarActionsPage.addVisitAction(button: 27, jumpDirection: "Visit to Page Down", directionType: "  Animate Down")
       
       //add navigation - right
       grammarActionsPage.addVisitAction(button: 28, jumpDirection: "Visit to Page Right", directionType: "  Animate Right")
       
       //add navigation - left
       grammarActionsPage.addVisitAction(button: 29, jumpDirection: "Visit to Page Left", directionType: "  Animate Left")
       
       //check if the action works
       actionsPage.checkVisitAction()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Visit to Page Test Finished with success!")
    }
}
