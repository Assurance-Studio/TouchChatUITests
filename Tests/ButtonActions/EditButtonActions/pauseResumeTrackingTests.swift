//
//  pauseResumeTrackingTests.swift
//  TouchChatAppUITests
//
//  Created by Alin V on 24.03.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class pauseResumeTrackingTests: XCTestCase {

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

   func testPauseResumeTracking() throws {
       
       let pages = Pages(app: app)
       let actionsPage = ActionaPageClass(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let vocabularyName = "copied vocabulary pause resume tracking"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       sleep(2)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary pause resume tracking"], vocab: vocabularyName)

       //enable delete vocab option
       profilesAndEditingPage.openTheSettingsTab()
       profilesAndEditingPage.ensureAllowDeleteIsOn()
       
       pages.editPage()
       //add an action
       actionsPage.editButtonForAction(nameButton: "Pause/Resume Tracking")
       
       //remove the speech message action
       actionsPage.removeSpeechMessageAction()
       
       //add time/date action
       actionsPage.addANewAction(actionName: "Pause/Resume Tracking")
       
       //save the action
       actionsPage.saveTheAction()
      
       //check if the action works
       app.buttons["Pause/Resume Tracking"].tap()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Pause Resume Tracking Action Test Finished with success!")
    }
}
