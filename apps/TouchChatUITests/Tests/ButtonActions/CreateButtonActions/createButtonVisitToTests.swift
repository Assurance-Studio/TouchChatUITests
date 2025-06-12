//  createButtonVisitToTests.swift
//  TouchChatAppUITests
//  Created by Alin V on 08.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class createButtonVisitToTests: XCTestCase {

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

   func testCreateBtnVisitToTests() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let grammarActionsPage = GrammarActionaPageClass(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let vocabularyName = "copied vocabulary visit to"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary visit to"], vocab: vocabularyName)

       //enable delete vocab option
       profilesAndEditingPage.openTheSettingsTab()
       profilesAndEditingPage.ensureAllowDeleteIsOn()
       
       pages.editPage()
       //add an action
       pages.removeAButton(button: 25)
       pages.createButtonForActions(button: 25, nameButton: "Visit to Page No Anim")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add no animation action
       actionsPage.addANewAction(actionName: "Visit")
       actionsPage.addNoAnimAction()
       
       //add navigation - up
       pages.removeAButton(button: 26)
       grammarActionsPage.addVisitCreateButtonAction(button: 26, jumpDirection: "Visit to Page Up", directionType: "  Animate Up")
       
       //add navigation - down
       pages.removeAButton(button: 27)
       grammarActionsPage.addVisitCreateButtonAction(button: 27, jumpDirection: "Visit to Page Down", directionType: "  Animate Down")
       
       //add navigation - right
       pages.removeAButton(button: 28)
       grammarActionsPage.addVisitCreateButtonAction(button: 28, jumpDirection: "Visit to Page Right", directionType: "  Animate Right")
       
       //add navigation - left
       pages.removeAButton(button: 29)
       grammarActionsPage.addVisitCreateButtonAction(button: 29, jumpDirection: "Visit to Page Left", directionType: "  Animate Left")
       
       //check if the action works
       actionsPage.checkVisitAction()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Create Button Visit to Page Test Finished with success!")
    }
}
