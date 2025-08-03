import XCTest

final class CreateButtonVisitToTestsRefactored: BaseTest {
    
    func testCreateBtnVisitToTests() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        let vocabularyName = "Create Button Visit To Vocabulary"
        let vocabularyDesc = "Vocabulary Description by e2e"
        
        // MARK: - When (Test Actions)
        // Copy a new vocabulary
        pages.mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        pages.mainPage.openVocab(vocab: vocabularyName)
        
        // Enable delete vocabulary option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // MARK: - Test 1: Visit to Page No Anim
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 25)
        pages.buttonActionsPage.createButtonForActions(button: 25, nameButton: "Visit to Page No Anim")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add no animation action
        pages.actionsPage.addANewAction(actionName: "Visit")
        pages.actionsPage.addNoAnimAction()
        
        // MARK: - Test 2: Visit to Page Up
        pages.buttonActionsPage.removeAButton(button: 26)
        pages.grammarActionsPage.addVisitCreateButtonAction(button: 26, jumpDirection: "Visit to Page Up", directionType: "  Animate Up")
        
        // MARK: - Test 3: Visit to Page Down
        pages.buttonActionsPage.removeAButton(button: 27)
        pages.grammarActionsPage.addVisitCreateButtonAction(button: 27, jumpDirection: "Visit to Page Down", directionType: "  Animate Down")
        
        // MARK: - Test 4: Visit to Page Right
        pages.buttonActionsPage.removeAButton(button: 28)
        pages.grammarActionsPage.addVisitCreateButtonAction(button: 28, jumpDirection: "Visit to Page Right", directionType: "  Animate Right")
        
        // MARK: - Test 5: Visit to Page Left
        pages.buttonActionsPage.removeAButton(button: 29)
        pages.grammarActionsPage.addVisitCreateButtonAction(button: 29, jumpDirection: "Visit to Page Left", directionType: "  Animate Left")
        
        // Check if the action works
        pages.actionsPage.checkVisitAction()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Create Button Visit to Page Test Finished Successfully!")
    }
} 