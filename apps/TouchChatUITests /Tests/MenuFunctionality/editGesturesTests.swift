//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class EditGesturesTests: XCTestCase {
    
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

    func testEditGesturesPage() throws {
        
        let pages = Pages(app: app)
        let gesturesPage = GesturesPage(app: app)
        let commonActions = CommonActions(app: app)
        let vocabularyName = "copied vocabulary gestures"
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
        
        //add a new gesture
        pages.editPage()
        gesturesPage.addNewGesture()
        gesturesPage.verifyGestureExists()
        commonActions.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Edit Gestures Test Finished with success!")
    }
}
