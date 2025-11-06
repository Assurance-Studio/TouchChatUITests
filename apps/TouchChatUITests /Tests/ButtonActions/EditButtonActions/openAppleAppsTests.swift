//
//  openAppleAppsTests.swift
//  TouchChatUITests
//
//  Created by Alin V on 21.01.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest
    
    final class openAppleAppsTests: XCTestCase {
        
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
        
        
        func testOpenAppleApps() throws {
            
            let pages = Pages(app: app)
            let actionsPage = ActionaPageClass(app: app)
            let grammarActionsPage = GrammarActionaPageClass(app: app)
            let commonActions = CommonActions(app: app)
            let vocabularyName = "copied vocabulary open apple apps"
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
            actionsPage.editButtonForAction(nameButton: "Open Apple Apps - Apple Maps")
            
            //remove the speech message action
            actionsPage.removeSpeechMessageAction()
            
            //add no animation action
            actionsPage.addANewAction(actionName: "Open App")
            app.staticTexts["Apple"].tap()
            app.staticTexts["Apple Maps"].tap()
            app.buttons["Save"].tap()
            
            grammarActionsPage.addOpenAppsAction(button: 26, navigateDirection: "Open Apple Apps - Calendar", actionType: "Open App", directionType: "Apple", appType: "Calendar")
            
            grammarActionsPage.addOpenAppsAction(button: 27, navigateDirection: "Open Apple Apps - Notes", actionType: "Open App", directionType: "Apple", appType: "Notes")
            
            grammarActionsPage.addOpenAppsAction(button: 28, navigateDirection: "Open Apple Apps - Photos", actionType: "Open App", directionType: "Apple", appType: "Photos")
            
            grammarActionsPage.addOpenAppsAction(button: 29, navigateDirection: "Open Apple Apps - Safari", actionType: "Open App", directionType: "Apple", appType: "Safari")
            
            grammarActionsPage.addOpenAppsAction(button: 30, navigateDirection: "Open Apple Apps - iMessage", actionType: "Open App", directionType: "Apple", appType: "iMessage")
            
            //check Notes App
            grammarActionsPage.checkNotesApp()
            
            commonActions.backToVocab()
            mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
                
                print("Open Apple Apps Test Finished with success!")
            }
        }
    
