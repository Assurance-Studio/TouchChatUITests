import XCTest

final class CreateButtonsOpenMetaTestsRefactored: BaseTest {
    
    func testCreateButtonOpenMetaApps() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        let vocabularyName = "Create Button Open Meta Apps Vocabulary"
        let vocabularyDesc = "Vocabulary Description by e2e"
        
        // MARK: - When (Test Actions)
        // Copy a new vocabulary
        pages.mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        pages.mainPage.openVocab(vocab: vocabularyName)
        
        // Enable delete vocabulary option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // MARK: - Test 1: Facebook
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 25)
        pages.buttonActionsPage.createButtonForActions(button: 25, nameButton: "Open Facebook Apps - Facebook")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add Facebook action
        pages.actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Facebook"].tap()
        app.staticTexts["Facebook"].tap()
        pages.waitPage.waitShort()
        app.buttons["Save"].tap()
        
        // MARK: - Test 2: Facebook Messenger
        pages.buttonActionsPage.removeAButton(button: 26)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Facebook Apps - Facebook Messenger", actionType: "Open App", directionType: "Facebook", appType: "Facebook Messenger")
        
        // MARK: - Test 3: Instagram
        pages.buttonActionsPage.removeAButton(button: 27)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Instagram App", actionType: "Open App", directionType: "Instagram", appType: "Instagram")
        
        // MARK: - Verification Tests
        // Check Facebook app
        pages.grammarActionsPage.checkFacebookApp()
        
        // Check Messenger App
        pages.grammarActionsPage.checkAppType(appType: "Open Facebook Apps - Facebook Messenger")
        
        // Check Instagram App
        pages.grammarActionsPage.checkAppType(appType: "Open Instagram App")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Create buttons for Open Meta Apps Test Finished Successfully!")
    }
} 