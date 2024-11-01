//  TouchChatUITests
//
//  Created by Alin Voinescu on 25.09.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class addTimeDateTests: XCTestCase {

    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        let pages = Pages(app: app)
        
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
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
       let vocabularyName = "copied vocabulary date action"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary date action"], vocab: vocabularyName)

       pages.editPage()
       //add an action
       actionsPage.editButtonForAction(nameButton: "Add Action Time/Date")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Add Time/Date")
       actionsPage.addActionForTimeDate(actionType: "Date Only")
       
       //check if the action works
       actionsPage.checkIfTheDateisDisplayed()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Date Action Test Finished with success!")
   }
    
}
