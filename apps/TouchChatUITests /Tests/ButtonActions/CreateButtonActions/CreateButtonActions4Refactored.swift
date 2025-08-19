import XCTest

final class CreateButtonActions4Refactored: BaseTest {
    
    func testCreateButtonActions4() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        let vocabularyName = "Create Button Actions 4 Vocabulary"
        let vocabularyDesc = "Vocabulary Description by e2e"
        
        // MARK: - When (Test Actions)
        // Copy a new vocabulary
        pages.mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        pages.mainPage.openVocab(vocab: vocabularyName)
        
        // Enable delete vocabulary option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // MARK: - Test 1: Google Website Toggle On
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 23)
        pages.buttonActionsPage.createButtonForActions(button: 23, nameButton: "Google Website Toggle On")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add website with restricted toggle turned on
        pages.actionsPage.addANewAction(actionName: "Open Website")
        pages.actionsPage.addWebsiteToggleOn()
        
        // Add website with restricted toggle turned off
        pages.grammarActionsPage.addWebsiteRestrictedToggleOff()
        
        // Check if the Google website works as expected - Toggle On
        pages.actionsPage.checkTheWebsiteToggleOn()
        
        // Check if the Google website works as expected - Toggle Off
        pages.actionsPage.checkTheWebsiteToggleOff()
        
        // MARK: - Test 2: Pause/Resume Tracking
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 28)
        pages.buttonActionsPage.createButtonForActions(button: 28, nameButton: "Pause/Resume Tracking")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add pause/resume tracking action
        pages.actionsPage.addANewAction(actionName: "Pause/Resume Tracking")
        
        // Save the action
        pages.actionsPage.saveTheAction()
        
        // Check if the action works
        app.buttons["Pause/Resume Tracking"].tap()
        
        // MARK: - Test 3: Text Copy and Paste
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 29)
        pages.buttonActionsPage.createButtonForActions(button: 29, nameButton: "Text Copy Button")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add text copy action
        pages.actionsPage.addANewAction(actionName: "Text Copy")
        
        // Save the action and add text paste
        pages.actionsPage.editTextPasteBtn()
        pages.actionsPage.removeSpeechMessageAction()
        pages.actionsPage.addANewAction(actionName: "Text Paste")
        pages.actionsPage.saveTheAction()
        
        // Check if the actions work as expected
        pages.actionsPage.checkTextPasteCopyFunctions()
        
        pages.common.checkSdbText(sdbText: "Endtoend ")
        
        // MARK: - Test 4: Visit Exception
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 25)
        pages.buttonActionsPage.createButtonForActions(button: 25, nameButton: "Visit Exception")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add visit exception action
        pages.actionsPage.addANewAction(actionName: "Visit Exception")
        
        // Save the action
        pages.actionsPage.saveTheAction()
        
        // Check if the action works
        app.buttons["Visit Exception"].tap()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Create button actions4 Test Finished Successfully!")
    }
} 