//  TouchChatUITests
//
//  Created by Alin Voinescu on 02.10.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class helpSignalTests: XCTestCase {

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

   func testHelpSignal() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let vocabularyName = "copied vocabulary help signal"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       sleep(2)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary help signal"], vocab: vocabularyName)

       pages.editPage()
       //add an action
       actionsPage.editButtonForAction(nameButton: "Help Signal")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Help Signal")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       app.buttons["Help Signal"].tap()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Help Signal Action Test Finished with success!")
    }
}
