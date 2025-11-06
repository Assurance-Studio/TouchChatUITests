//  TouchChatUITests
//
//  Created by Alin Voinescu on 03.10.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class jumpToPageTests: XCTestCase {

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

   func testJumpToPageTests() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let grammarActionsPage = GrammarActionaPageClass(app: app)
       let commonActions = CommonActions(app: app)
       let vocabularyName = "copied vocabulary jump to page"
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
       actionsPage.editButtonForAction(nameButton: "Jump To Page No Anim")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add action Jump To Page
       actionsPage.addANewAction(actionName: "Jump To Page")
       actionsPage.addNoAnimAction()
       
       //add Jump to Page - Animate Up
       grammarActionsPage.addJumpAction(button: 26, jumpDirection: "Jump To Page Up", directionType: "  Animate Up")
       
       //add Jump To Page - Animate Down
       grammarActionsPage.addJumpAction(button: 27, jumpDirection: "Jump To Page Down", directionType: "  Animate Down")
       
       //add Jump To Page - Animate Right
       grammarActionsPage.addJumpAction(button: 28, jumpDirection: "Jump To Page Right", directionType: "  Animate Right")
       
       //add Jump To Page - Animate Left
       grammarActionsPage.addJumpAction(button: 29, jumpDirection: "Jump To Page Left", directionType: "  Animate Left")
       
       //check if the jump to page actions works as expected
       actionsPage.checkTheJumpActions()
       
       commonActions.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Jump To Page Action Test Finished with success!")
    }
}
