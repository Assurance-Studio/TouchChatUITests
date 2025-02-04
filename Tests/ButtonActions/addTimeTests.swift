//  TouchChatUITests
//
//  Created by Alin V on 01.11.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class addTimeTests: XCTestCase {

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

   func testAddTimeTests() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let vocabularyName = "copied vocabulary time action"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary time action"], vocab: vocabularyName)

       pages.editPage()
       //add an action
       actionsPage.editButtonForAction(nameButton: "Add Action Time")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time action
       actionsPage.addANewAction(actionName: "Add Time/Date")
       
       actionsPage.addActionForTimeDate(actionType: "Time Only")
       
       //check if the action works
       actionsPage.checkIfTheTimeisDisplayed()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Time Action Test Finished with success!")
    }
}
