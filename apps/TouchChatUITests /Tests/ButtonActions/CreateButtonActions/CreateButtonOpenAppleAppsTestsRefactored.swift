import XCTest

final class CreateButtonOpenAppleAppsTestsRefactored: BaseTest {
    
    func testCreateButtonOpenAppleApps() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        let vocabularyName = "Create Button Open Apple Apps Vocabulary"
        let vocabularyDesc = "Vocabulary Description by e2e"
        
        // MARK: - When (Test Actions)
        // Copy a new vocabulary
        pages.mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        pages.mainPage.openVocab(vocab: vocabularyName)
        
        // Enable delete vocabulary option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // MARK: - Test 1: Apple Maps
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 25)
        pages.buttonActionsPage.createButtonForActions(button: 25, nameButton: "Open Facebook Apps - Facebook")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add Apple Maps action
        pages.actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Apple"].tap()
        app.staticTexts["Apple Maps"].tap()
        pages.waitPage.waitShort()
        app.buttons["Save"].tap()
        
        // MARK: - Test 2-6: Various Apple Apps
        // Calendar
        pages.buttonActionsPage.removeAButton(button: 26)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Apple Apps - Calendar", actionType: "Open App", directionType: "Apple", appType: "Calendar")
        
        // Notes
        pages.buttonActionsPage.removeAButton(button: 27)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Apple Apps - Notes", actionType: "Open App", directionType: "Apple", appType: "Notes")
        
        // Photos
        pages.buttonActionsPage.removeAButton(button: 28)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 28, navigateDirection: "Open Apple Apps - Photos", actionType: "Open App", directionType: "Apple", appType: "Photos")
        
        // Safari
        pages.buttonActionsPage.removeAButton(button: 29)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 29, navigateDirection: "Open Apple Apps - Safari", actionType: "Open App", directionType: "Apple", appType: "Safari")
        
        // iMessage
        pages.buttonActionsPage.removeAButton(button: 30)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 30, navigateDirection: "Open Apple Apps - iMessage", actionType: "Open App", directionType: "Apple", appType: "iMessage")
        
        // MARK: - Verification Tests
        // Check Notes App
        pages.grammarActionsPage.checkNotesApp()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Create buttons for Open Apple Apps Test Finished Successfully!")
    }
} 