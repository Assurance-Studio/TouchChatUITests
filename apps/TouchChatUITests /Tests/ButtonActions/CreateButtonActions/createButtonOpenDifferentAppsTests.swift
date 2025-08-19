//
//  createButtonOpenDifferentAppsTests.swift
//  TouchChatAppUITests
//
//  Created by Alin V on 07.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class createButtonOpenDifferentAppsTests: XCTestCase {

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
    
    
    func testOpenDifferentApp() throws {
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        let vocabularyName = "copied vocabulary create different apps"
        let vocabylaryDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocab: vocabularyName)
        
        //enable delete vocab option
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Open Different Apps - ChoiceWorks")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["ChoiceWorks"].tap()
        app.staticTexts["ChoiceWorks"].tap()
        sleep(3)
        app.buttons["Save"].tap()
        
        //create button ChoiceWorks
        pages.removeAButton(button: 26)
        grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Different Apps - ChoiceWorks Calendar", actionType: "Open App", directionType: "ChoiceWorks", appType: "Choiceworks Calendar")
        
        //create button Disney+
        pages.removeAButton(button: 27)
        grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Different Apps - Disney", actionType: "Open App", directionType: "Disney", appType: "Disney+")
        
        //create button Bose Connect
        pages.removeAButton(button: 28)
        grammarActionsPage.createButtonOpenAppsAction(button: 28, navigateDirection: "Open Different Apps - Bose", actionType: "Open App", directionType: "Bose", appType: "Bose Connect")
        
        //create button DoorDash
        pages.removeAButton(button: 29)
        grammarActionsPage.createButtonOpenAppsAction(button: 29, navigateDirection: "Open Different Apps - DoorDash", actionType: "Open App", directionType: "DoorDash", appType: "DoorDash")
        
        //create button Fandango
        pages.removeAButton(button: 30)
        grammarActionsPage.createButtonOpenAppsAction(button: 30, navigateDirection: "Open Different Apps - Fandango", actionType: "Open App", directionType: "Fandango", appType: "Fandango")
        
        //create button FitBit
        pages.removeAButton(button: 31)
        grammarActionsPage.createButtonOpenAppsAction(button: 31, navigateDirection: "Open Different Apps - FitBit", actionType: "Open App", directionType: "FitBit", appType: "FitBit")
        
        //create button Flickr
        pages.removeAButton(button: 24)
        grammarActionsPage.createButtonOpenAppsAction(button: 24, navigateDirection: "Open Different Apps - Flickr", actionType: "Open App", directionType: "Flickr", appType: "Flickr")
        
        //create button Hulu
        pages.removeAButton(button: 43)
        grammarActionsPage.createButtonOpenAppsAction(button: 43, navigateDirection: "Open Different Apps - Hulu", actionType: "Open App", directionType: "Hulu", appType: "Hulu")
        
        //create button MS Word
        pages.removeAButton(button: 44)
        grammarActionsPage.createButtonOpenAppsAction(button: 44, navigateDirection: "Open Different Apps - Microsoft", actionType: "Open App", directionType: "Microsoft", appType: "MS Word")
        
        //create button Netflix
        pages.removeAButton(button: 45)
        grammarActionsPage.createButtonOpenAppsAction(button: 45, navigateDirection: "Open Different Apps - Netflix", actionType: "Open App", directionType: "Netflix", appType: "Netflix")
        
        //create button Pandora
        pages.removeAButton(button: 46)
        grammarActionsPage.createButtonOpenAppsAction(button: 46, navigateDirection: "Open Different Apps - Pandora", actionType: "Open App", directionType: "Pandora", appType: "Pandora")
        
        //create button Pictello
        pages.removeAButton(button: 47)
        grammarActionsPage.createButtonOpenAppsAction(button: 47, navigateDirection: "Open Different Apps - Pair By Number", actionType: "Open App", directionType: "Pictello", appType: "Pictello")
        
        //create button Pinterest
        pages.removeAButton(button: 48)
        grammarActionsPage.createButtonOpenAppsAction(button: 48, navigateDirection: "Open Different Apps - Pinterest", actionType: "Open App", directionType: "Pinterest", appType: "Pinterest")
        
        //create button Scribd
        pages.removeAButton(button: 49)
        grammarActionsPage.createButtonOpenAppsAction(button: 49, navigateDirection: "Open Different Apps - Scribd", actionType: "Open App", directionType: "Scribd", appType: "Scribd")
        
        //create button Sort By Kind Sort visually
        pages.removeAButton(button: 50)
        grammarActionsPage.createButtonOpenAppsAction(button: 50, navigateDirection: "Open Different Apps - Sort By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Kind - Sort visually related items")
        
        //create button Skype
        pages.removeAButton(button: 63)
        grammarActionsPage.createButtonOpenAppsAction(button: 63, navigateDirection: "Open Different Apps - Skype", actionType: "Open App", directionType: "Skype", appType: "Skype")
        
        //create button Snapchat
        pages.removeAButton(button: 64)
        grammarActionsPage.createButtonOpenAppsAction(button: 64, navigateDirection: "Open Different Apps - Snapchat", actionType: "Open App", directionType: "Snapchat", appType: "Snapchat")
        
        //create button Spotify
        pages.removeAButton(button: 65)
        grammarActionsPage.createButtonOpenAppsAction(button: 65, navigateDirection: "Open Different Apps - Spotify", actionType: "Open App", directionType: "Spotify", appType: "Spotify")
        
        //create button Visual Schedule HD
        pages.removeAButton(button: 67)
        grammarActionsPage.createButtonOpenAppsAction(button: 67, navigateDirection: "Open Diffrent Apps - First Then Visual Schedule HD", actionType: "Open App", directionType: "First Then Visual Schedule HD", appType: "First Then Visual Schedule HD")
        
        //create button Visual Timer
        pages.removeAButton(button: 68)
        grammarActionsPage.createButtonOpenAppsAction(button: 68, navigateDirection: "Open Diffrent Apps - Time", actionType: "Open App", directionType: "Time", appType: "Visual Timer")
        
        //create button Twitter
        pages.removeAButton(button: 69)
        grammarActionsPage.createButtonOpenAppsAction(button: 69, navigateDirection: "Open Diffrent Apps - Twitter", actionType: "Open App", directionType: "Twitter", appType: "Twitter")
        
        //create button Waze
        pages.removeAButton(button: 70)
        grammarActionsPage.createButtonOpenAppsAction(button: 70, navigateDirection: "Open Diffrent Apps - Waze", actionType: "Open App", directionType: "Waze", appType: "Waze")
        
        //create button WhatsApp
        pages.removeAButton(button: 71)
        grammarActionsPage.createButtonOpenAppsAction(button: 71, navigateDirection: "Open Diffrent Apps - WhatsApp", actionType: "Open App", directionType: "WhatsApp", appType: "WhatsApp")
        
        //create button WhatsApp Client
        pages.removeAButton(button: 22)
        grammarActionsPage.createButtonOpenAppsAction(button: 22, navigateDirection: "Open Diffrent Apps - WhatsApp Client iPad", actionType: "Open App", directionType: "WhatsApp", appType: "WhatsApp Web Client for iPad")
        
        //create button Youtube
        pages.removeAButton(button: 23)
        grammarActionsPage.createButtonOpenAppsAction(button: 23, navigateDirection: "Open Diffrent Apps - YouTube", actionType: "Open App", directionType: "YouTube", appType: "YouTube")
        
        //create button YouTube Kids
        pages.removeAButton(button: 42)
        grammarActionsPage.createButtonOpenAppsAction(button: 42, navigateDirection: "Open Diffrent Apps - YouTube Kids", actionType: "Open App", directionType: "YouTube", appType: "YouTube Kids")
        
        //check Facebook app
        app.buttons["Done"].tap()
        app.buttons["Open Different Apps - ChoiceWorks"].tap()
        let errorText = app.staticTexts["Error"]
        XCTAssertTrue(errorText.exists, "The error is not visible")
        app.buttons["Okay"].tap()
        
        //check ChoiceWorks Calendar App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - ChoiceWorks Calendar")
        
        //check Disney App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Disney")
                                        
        //check Bose App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Bose")
        
        //check DoorDash App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - DoorDash")
        
        //check Fandango App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Fandango")
        
        //check FitBit App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - FitBit")
        
        //check Flickr App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Flickr")
        
        //check Hulu App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Hulu")
        
        //check Microsoft App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Microsoft")
        
        //check Netflix App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Netflix")
        
        //check Pandora App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Pandora")
        
        //check Pair By Number App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Pair By Number")
        
        //check Pinterest App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Pinterest")
        
        //check Scribd App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Scribd")
        
        //check Sort By Kind App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Sort By Kind")
        
        //check Skype App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Skype")
        
        //check Snapchat App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Snapchat")
        
        //check Spotify App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Spotify")
        
        //check First Then Visual Schedule HD App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - First Then Visual Schedule HD")
        
        //check Time App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - Time")
        
        //check Twitter App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - Twitter")
        
        //check Waze App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - Waze")
        
        //check WhatsApp App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - WhatsApp")
        
        //check YouTube App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - YouTube")
        
        //check YouTube Kids App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - YouTube Kids")
       
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
        print("Open Different Apps Test Finished with success!")
    }
}
