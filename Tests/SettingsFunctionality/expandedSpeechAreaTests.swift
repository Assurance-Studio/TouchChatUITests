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
            
            app = XCUIApplication()
            app.launchArguments.append("--reset")
            app.launch()
            pages.clearAppCache()
            pages.resetPersistentStorage()
            pages.reachMenuPageIfOnVocabPage()
            pages.deleteVocabFromVocabPageIfExisting(deleteCircle: "minus.circle.fill", maxScrolls: 3, timeout: 5)
        }
        
        override func tearDownWithError() throws {
            app.terminate()
            try super.tearDownWithError()
        }
        
        func testExpandedSpeechAreaTests() throws {
            let vocabularyName = "copied vocabulary speech display bar"
            let vocabylaryDesc = "vocabulary description e2e"
            var vocabName = "vocabulary"
            lazy var mainPage: MainPage = {
                return MainPage(app: XCUIApplication(), vocabName: vocabName)
            }()
            let pages = Pages(app: app)
            let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
            let expandedSpeechArea = ExpandedSpeechDisplayArea(app: app)
            
            pages.scrollDownUntilElementIsVisible(element: pages.basic4SS)
            //copy a new vocab
            mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
            mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary speech display bar"], vocab: vocabularyName)
            
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
            
            pages.backToVocab()
            mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
            print("Expanded Speech Area Test Finished with success!")
            
            app.terminate()
            
        }
    }
