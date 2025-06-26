//
//  openDifferentAppsTests.swift
//  TouchChatUITests
//
//  Created by Alin V on 29.01.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class openDifferentAppsTests: XCTestCase {

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
    
    
    func testOpenDifferentApps() throws {
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let vocabularyName = "copied vocabulary open different apps"
        let vocabylaryDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary open different apps"], vocab: vocabularyName)
        
        //enable delete vocab option
<<<<<<< HEAD:Tests/ButtonActions/EditButtonActions/openDifferentAppsTests.swift
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
=======
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.ensureAllowDeleteIsOn()
>>>>>>> ip_june2025:apps/TouchChatUITests/Tests/ButtonActions/EditButtonActions/openDifferentAppsTests.swift
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Open Different Apps - ChoiceWorks")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["ChoiceWorks"].tap()
        app.staticTexts["ChoiceWorks"].tap()
        app.buttons["Save"].tap()
        
        grammarActionsPage.addOpenAppsAction(button: 26, navigateDirection: "Open Different Apps - ChoiceWorks Calendar", actionType: "Open App", directionType: "ChoiceWorks", appType: "Choiceworks Calendar")
        
        grammarActionsPage.addOpenAppsAction(button: 27, navigateDirection: "Open Different Apps - Disney", actionType: "Open App", directionType: "Disney", appType: "Disney+")
        
        grammarActionsPage.addOpenAppsAction(button: 28, navigateDirection: "Open Different Apps - Bose", actionType: "Open App", directionType: "Bose", appType: "Bose Connect")
        
        grammarActionsPage.addOpenAppsAction(button: 29, navigateDirection: "Open Different Apps - DoorDash", actionType: "Open App", directionType: "DoorDash", appType: "DoorDash")
        
        grammarActionsPage.addOpenAppsAction(button: 30, navigateDirection: "Open Different Apps - Fandango", actionType: "Open App", directionType: "Fandango", appType: "Fandango")
        
        grammarActionsPage.addOpenAppsAction(button: 31, navigateDirection: "Open Different Apps - FitBit", actionType: "Open App", directionType: "FitBit", appType: "FitBit")
        
        grammarActionsPage.addOpenAppsAction(button: 24, navigateDirection: "Open Different Apps - Flickr", actionType: "Open App", directionType: "Flickr", appType: "Flickr")
        
        grammarActionsPage.addOpenAppsAction(button: 43, navigateDirection: "Open Different Apps - Hulu", actionType: "Open App", directionType: "Hulu", appType: "Hulu")
        
        grammarActionsPage.addOpenAppsAction(button: 44, navigateDirection: "Open Different Apps - Microsoft", actionType: "Open App", directionType: "Microsoft", appType: "MS Word")
        
        grammarActionsPage.addOpenAppsAction(button: 45, navigateDirection: "Open Different Apps - Netflix", actionType: "Open App", directionType: "Netflix", appType: "Netflix")
        
        grammarActionsPage.addOpenAppsAction(button: 46, navigateDirection: "Open Different Apps - Pandora", actionType: "Open App", directionType: "Pandora", appType: "Pandora")
        
        grammarActionsPage.addOpenAppsAction(button: 47, navigateDirection: "Open Different Apps - Pair By Number", actionType: "Open App", directionType: "Pictello", appType: "Pictello")
        
        grammarActionsPage.addOpenAppsAction(button: 48, navigateDirection: "Open Different Apps - Pinterest", actionType: "Open App", directionType: "Pinterest", appType: "Pinterest")
        
        grammarActionsPage.addOpenAppsAction(button: 49, navigateDirection: "Open Different Apps - Scribd", actionType: "Open App", directionType: "Scribd", appType: "Scribd")
        
        grammarActionsPage.addOpenAppsAction(button: 50, navigateDirection: "Open Different Apps - Sort By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Kind - Sort visually related items")
        
        grammarActionsPage.addOpenAppsAction(button: 63, navigateDirection: "Open Different Apps - Skype", actionType: "Open App", directionType: "Skype", appType: "Skype")
        
        grammarActionsPage.addOpenAppsAction(button: 64, navigateDirection: "Open Different Apps - Snapchat", actionType: "Open App", directionType: "Snapchat", appType: "Snapchat")
        
        grammarActionsPage.addOpenAppsAction(button: 65, navigateDirection: "Open Different Apps - Spotify", actionType: "Open App", directionType: "Spotify", appType: "Spotify")
        
        grammarActionsPage.addOpenAppsAction(button: 67, navigateDirection: "Open Diffrent Apps - First Then Visual Schedule HD", actionType: "Open App", directionType: "First Then Visual Schedule HD", appType: "First Then Visual Schedule HD")
        
        grammarActionsPage.addOpenAppsAction(button: 68, navigateDirection: "Open Diffrent Apps - Time", actionType: "Open App", directionType: "Time", appType: "Visual Timer")
        
        grammarActionsPage.addOpenAppsAction(button: 69, navigateDirection: "Open Diffrent Apps - Twitter", actionType: "Open App", directionType: "Twitter", appType: "Twitter")
        
        grammarActionsPage.addOpenAppsAction(button: 70, navigateDirection: "Open Diffrent Apps - Waze", actionType: "Open App", directionType: "Waze", appType: "Waze")
        
        grammarActionsPage.addOpenAppsAction(button: 71, navigateDirection: "Open Diffrent Apps - WhatsApp", actionType: "Open App", directionType: "WhatsApp", appType: "WhatsApp")
        
        grammarActionsPage.addOpenAppsAction(button: 22, navigateDirection: "Open Diffrent Apps - WhatsApp Client iPad", actionType: "Open App", directionType: "WhatsApp", appType: "WhatsApp Web Client for iPad")
        
        grammarActionsPage.addOpenAppsAction(button: 23, navigateDirection: "Open Diffrent Apps - YouTube", actionType: "Open App", directionType: "YouTube", appType: "YouTube")
        
        grammarActionsPage.addOpenAppsAction(button: 42, navigateDirection: "Open Diffrent Apps - YouTube Kids", actionType: "Open App", directionType: "YouTube", appType: "YouTube Kids")
        
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
