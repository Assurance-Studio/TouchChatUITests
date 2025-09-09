//
//  textCopyPasteTests.swift
//  TouchChatAppUITests
//
//  Created by Alin Voinescu on 12.02.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class textCopyPasteTests: XCTestCase {

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

   func testTextCopyPaste() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let commonActions = CommonActions(app: app)
       let vocabularyName = "copied vocabulary copy paste text"
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
       actionsPage.editButtonForAction(nameButton: "Text Copy Button")
       
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
      
       //Paste function for sdb
//       let centerScreenCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.1))
//
//       centerScreenCoordinate.tap()
       
       commonActions.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Copy Paste Text Test Finished with success!")
    }
}
