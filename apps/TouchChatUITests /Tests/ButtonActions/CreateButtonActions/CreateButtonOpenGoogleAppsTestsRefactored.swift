import XCTest

final class CreateButtonOpenGoogleAppsTestsRefactored: BaseTest {
    
    func testOpenGoogleApplications() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        let vocabularyName = "Create Button Open Google Apps Vocabulary"
        let vocabularyDesc = "Vocabulary Description by e2e"
        
        // MARK: - When (Test Actions)
        // Copy a new vocabulary
        pages.mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        pages.mainPage.openVocab(vocab: vocabularyName)
        
        // Enable delete vocabulary option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // MARK: - Test 1: Gmail
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 25)
        pages.buttonActionsPage.createButtonForActions(button: 25, nameButton: "Open Google Apps - GMail")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add Gmail action
        pages.actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Google"].tap()
        app.staticTexts["GMail"].tap()
        app.buttons["Save"].tap()
        
        // MARK: - Test 2-6: Various Google Apps
        // Google
        pages.buttonActionsPage.removeAButton(button: 26)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Google Apps - Google", actionType: "Open App", directionType: "Google", appType: "Google")
        
        // Google Docs
        pages.buttonActionsPage.removeAButton(button: 27)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Google Apps - Google Docs", actionType: "Open App", directionType: "Google", appType: "Google Docs")
        
        // Google Drive
        pages.buttonActionsPage.removeAButton(button: 28)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 28, navigateDirection: "Open Google Apps - Google Drive", actionType: "Open App", directionType: "Google", appType: "Google Drive")
        
        // Google Maps
        pages.buttonActionsPage.removeAButton(button: 29)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 29, navigateDirection: "Open Google Apps - Google Maps", actionType: "Open App", directionType: "Google", appType: "Google Maps")
        
        // Google Slides
        pages.buttonActionsPage.removeAButton(button: 30)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 30, navigateDirection: "Open Google Apps - Google Slides", actionType: "Open App", directionType: "Google", appType: "Google Slides")
        
        // MARK: - Verification Tests
        // Check Google app
        pages.grammarActionsPage.checkGoogleApp()
        
        // Check various Google apps
        pages.grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Docs")
        pages.grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Drive")
        pages.grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Maps")
        pages.grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Slides")
        pages.grammarActionsPage.checkAppType(appType: "Open Google Apps - GMail")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Open Google Apps Test Finished Successfully!")
    }
} 