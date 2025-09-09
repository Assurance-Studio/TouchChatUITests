//  TouchChatUITests
//
//  Created by Alin Voinescu on 13.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.


import XCTest

final class expandedSpeechAreaTests: XCTestCase {
        
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
        
        func testExpandedSpeechAreaTests() throws {
            let vocabularyName = "copied vocabulary speech display bar"
            let vocabularyDesc = "vocabulary description e2e"
            let vocabName = "vocabulary"
            lazy var mainPage: MainPage = {
                return MainPage(app: XCUIApplication(), vocabName: vocabName)
            }()
            let pages = Pages(app: app)
            let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
            let expandedSpeechArea = ExpandedSpeechDisplayArea(app: app)
            let commonActions = CommonActions(app: app)
            
            //copy a new vocab
            mainPage.nameVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
             
            //enable rename vocab option
            commonActions.openTheSettingsTab()
            commonActions.ensureAllowDeleteIsOn()
            
            //open The Settings Menu
            profilesAndEditingPage.openTheSettingsTab()
            
            //check the fonts for expanded speech area
            expandedSpeechArea.checkTheFontOptions()
                                    
            //check the font size
            expandedSpeechArea.checkTheFontSize()
                        
            //check the font color
            expandedSpeechArea.checkTheFontColors()
            
            //check the background color
            expandedSpeechArea.checkBackgroundColors()
            
            commonActions.backToVocab()
            mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
            print("Expanded Speech Area Test Finished with success!")
            
            app.terminate()
            
        }
    }
