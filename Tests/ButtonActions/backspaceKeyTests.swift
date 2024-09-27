//  TouchChatUITests
//
//  Created by Alin Voinescu on 26.09.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.


import XCTest

final class backspaceKeyTests: XCTestCase {

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

   func testBackSpaceKey() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let vocabularyName = "copied vocabulary backspace key"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       sleep(2)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary backspace key"], vocab: vocabularyName)

       pages.editPage()
       //add an action
       actionsPage.editButtonForAction(nameButton: "Backspace Key")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Backspace Key")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       actionsPage.checkIfTheActionsWorks()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Backspace Key Action Test Finished with success!")
   }
}
