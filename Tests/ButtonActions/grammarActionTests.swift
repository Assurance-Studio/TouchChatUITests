//  TouchChatUITests
//
//  Created by Alin Voinescu on 02.10.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class grammarActionTests: XCTestCase {

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

   func testGrammarAction() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let grammarActionsPage = GrammarActionaPageClass(app: app)
       let vocabularyName = "copied vocabulary grammar action"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       sleep(2)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary grammar action"], vocab: vocabularyName)

       pages.editPage()
       //add an action
       actionsPage.editButtonForAction(nameButton: "Grammar Action -ed")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add grammar action -ed
       actionsPage.addANewAction(actionName: "Grammar Action")
       grammarActionsPage.addActionED()
       
       //add grammar action -en
       grammarActionsPage.addActionEN()
       
       //add grammar action -er
       grammarActionsPage.addActionER()
       
       //add grammar action -est
       grammarActionsPage.addActionEST()
       
       //add grammar action -ing
       grammarActionsPage.addActionING()
       
       //add grammar action -ly
       grammarActionsPage.addActionLY()
       
       //add grammar -s
       grammarActionsPage.addActionS()
       
       //create a new button
       grammarActionsPage.createAVerb()
       
       //app.buttons["z"].tap()
       grammarActionsPage.createAnAdjective()
       
       //check if the grammar action works as expected
       grammarActionsPage.checkGrammarAction()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Grammar Action Test Finished with success!")
    }
}
