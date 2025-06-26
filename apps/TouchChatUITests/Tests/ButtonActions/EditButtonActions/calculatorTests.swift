//  TouchChatUITests
//
//  Created by Alin Voinescu on 30.09.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class calculatorTests: XCTestCase {

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

   func testCalculator() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let vocabularyName = "copied vocabulary calculator"
       let vocabylaryDesc = "vocabulary description e2e"
       let vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       sleep(2)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary calculator"], vocab: vocabularyName)

       //enable delete vocab option
<<<<<<< HEAD:Tests/ButtonActions/EditButtonActions/calculatorTests.swift
       pages.openTheSettingsTab()
       pages.ensureAllowDeleteIsOn()
=======
       profilesAndEditingPage.openTheSettingsTab()
       profilesAndEditingPage.ensureAllowDeleteIsOn()
>>>>>>> ip_june2025:apps/TouchChatUITests/Tests/ButtonActions/EditButtonActions/calculatorTests.swift
       
       pages.editPage()
       //add an action
       actionsPage.editButtonForAction(nameButton: "Calculator")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Calculator")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       actionsPage.checkTheCalculatorAction()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Calculator Action Test Finished with success!")
    }
}
