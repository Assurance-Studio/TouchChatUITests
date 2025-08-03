import XCTest

final class CreateButtonOpenDifferentAppsTestsRefactored: BaseTest {
    
    func testOpenDifferentApp() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        let vocabularyName = "Create Button Open Different Apps Vocabulary"
        let vocabularyDesc = "Vocabulary Description by e2e"
        
        // MARK: - When (Test Actions)
        // Copy a new vocabulary
        pages.mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        pages.mainPage.openVocab(vocab: vocabularyName)
        
        // Enable delete vocabulary option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // MARK: - Test 1: ChoiceWorks
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 25)
        pages.buttonActionsPage.createButtonForActions(button: 25, nameButton: "Open Different Apps - ChoiceWorks")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add ChoiceWorks action
        pages.actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["ChoiceWorks"].tap()
        app.staticTexts["ChoiceWorks"].tap()
        pages.waitPage.waitShort()
        app.buttons["Save"].tap()
        
        // MARK: - Test 2-25: Various Different Apps
        // ChoiceWorks Calendar
        pages.buttonActionsPage.removeAButton(button: 26)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Different Apps - ChoiceWorks Calendar", actionType: "Open App", directionType: "ChoiceWorks", appType: "Choiceworks Calendar")
        
        // Disney+
        pages.buttonActionsPage.removeAButton(button: 27)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Different Apps - Disney", actionType: "Open App", directionType: "Disney", appType: "Disney+")
        
        // Bose Connect
        pages.buttonActionsPage.removeAButton(button: 28)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 28, navigateDirection: "Open Different Apps - Bose", actionType: "Open App", directionType: "Bose", appType: "Bose Connect")
        
        // DoorDash
        pages.buttonActionsPage.removeAButton(button: 29)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 29, navigateDirection: "Open Different Apps - DoorDash", actionType: "Open App", directionType: "DoorDash", appType: "DoorDash")
        
        // Fandango
        pages.buttonActionsPage.removeAButton(button: 30)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 30, navigateDirection: "Open Different Apps - Fandango", actionType: "Open App", directionType: "Fandango", appType: "Fandango")
        
        // FitBit
        pages.buttonActionsPage.removeAButton(button: 31)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 31, navigateDirection: "Open Different Apps - FitBit", actionType: "Open App", directionType: "FitBit", appType: "FitBit")
        
        // Flickr
        pages.buttonActionsPage.removeAButton(button: 24)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 24, navigateDirection: "Open Different Apps - Flickr", actionType: "Open App", directionType: "Flickr", appType: "Flickr")
        
        // Hulu
        pages.buttonActionsPage.removeAButton(button: 43)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 43, navigateDirection: "Open Different Apps - Hulu", actionType: "Open App", directionType: "Hulu", appType: "Hulu")
        
        // Microsoft Word
        pages.buttonActionsPage.removeAButton(button: 44)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 44, navigateDirection: "Open Different Apps - Microsoft", actionType: "Open App", directionType: "Microsoft", appType: "MS Word")
        
        // Netflix
        pages.buttonActionsPage.removeAButton(button: 45)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 45, navigateDirection: "Open Different Apps - Netflix", actionType: "Open App", directionType: "Netflix", appType: "Netflix")
        
        // Pandora
        pages.buttonActionsPage.removeAButton(button: 46)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 46, navigateDirection: "Open Different Apps - Pandora", actionType: "Open App", directionType: "Pandora", appType: "Pandora")
        
        // Pictello
        pages.buttonActionsPage.removeAButton(button: 47)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 47, navigateDirection: "Open Different Apps - Pair By Number", actionType: "Open App", directionType: "Pictello", appType: "Pictello")
        
        // Pinterest
        pages.buttonActionsPage.removeAButton(button: 48)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 48, navigateDirection: "Open Different Apps - Pinterest", actionType: "Open App", directionType: "Pinterest", appType: "Pinterest")
        
        // Scribd
        pages.buttonActionsPage.removeAButton(button: 49)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 49, navigateDirection: "Open Different Apps - Scribd", actionType: "Open App", directionType: "Scribd", appType: "Scribd")
        
        // Step by Step
        pages.buttonActionsPage.removeAButton(button: 50)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 50, navigateDirection: "Open Different Apps - Sort By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Kind - Sort visually related items")
        
        // Skype
        pages.buttonActionsPage.removeAButton(button: 63)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 63, navigateDirection: "Open Different Apps - Skype", actionType: "Open App", directionType: "Skype", appType: "Skype")
        
        // Snapchat
        pages.buttonActionsPage.removeAButton(button: 64)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 64, navigateDirection: "Open Different Apps - Snapchat", actionType: "Open App", directionType: "Snapchat", appType: "Snapchat")
        
        // Spotify
        pages.buttonActionsPage.removeAButton(button: 65)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 65, navigateDirection: "Open Different Apps - Spotify", actionType: "Open App", directionType: "Spotify", appType: "Spotify")
        
        // First Then Visual Schedule HD
        pages.buttonActionsPage.removeAButton(button: 67)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 67, navigateDirection: "Open Diffrent Apps - First Then Visual Schedule HD", actionType: "Open App", directionType: "First Then Visual Schedule HD", appType: "First Then Visual Schedule HD")
        
        // Visual Timer
        pages.buttonActionsPage.removeAButton(button: 68)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 68, navigateDirection: "Open Diffrent Apps - Time", actionType: "Open App", directionType: "Time", appType: "Visual Timer")
        
        // Twitter
        pages.buttonActionsPage.removeAButton(button: 69)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 69, navigateDirection: "Open Diffrent Apps - Twitter", actionType: "Open App", directionType: "Twitter", appType: "Twitter")
        
        // Waze
        pages.buttonActionsPage.removeAButton(button: 70)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 70, navigateDirection: "Open Diffrent Apps - Waze", actionType: "Open App", directionType: "Waze", appType: "Waze")
        
        // WhatsApp
        pages.buttonActionsPage.removeAButton(button: 71)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 71, navigateDirection: "Open Diffrent Apps - WhatsApp", actionType: "Open App", directionType: "WhatsApp", appType: "WhatsApp")
        
        // WhatsApp Web Client
        pages.buttonActionsPage.removeAButton(button: 22)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 22, navigateDirection: "Open Diffrent Apps - WhatsApp Client iPad", actionType: "Open App", directionType: "WhatsApp", appType: "WhatsApp Web Client for iPad")
        
        // YouTube
        pages.buttonActionsPage.removeAButton(button: 23)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 23, navigateDirection: "Open Diffrent Apps - YouTube", actionType: "Open App", directionType: "YouTube", appType: "YouTube")
        
        // YouTube Kids
        pages.buttonActionsPage.removeAButton(button: 42)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 42, navigateDirection: "Open Diffrent Apps - YouTube Kids", actionType: "Open App", directionType: "YouTube", appType: "YouTube Kids")
        
        // MARK: - Verification Tests
        // Check various apps
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - ChoiceWorks Calendar")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Disney")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Bose")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - DoorDash")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Fandango")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - FitBit")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Flickr")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Hulu")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Microsoft")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Netflix")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Pandora")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Pair By Number")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Pinterest")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Scribd")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Sort By Kind")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Skype")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Snapchat")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Spotify")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - First Then Visual Schedule HD")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Time")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Twitter")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - Waze")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - WhatsApp")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - YouTube")
        pages.grammarActionsPage.checkAppType(appType: "Open Different Apps - YouTube Kids")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Open Different Apps Test Finished Successfully!")
    }
} 