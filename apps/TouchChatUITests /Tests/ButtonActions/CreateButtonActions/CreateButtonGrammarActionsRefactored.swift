import XCTest

final class CreateButtonGrammarActionsRefactored: BaseTest {
    
    func testCreateButtonGrammarActions() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        let vocabularyName = "Create Button Grammar Actions Vocabulary"
        let vocabularyDesc = "Vocabulary Description by e2e"
        
        // MARK: - When (Test Actions)
        // Copy a new vocabulary
        pages.mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        pages.mainPage.openVocab(vocab: vocabularyName)
        
        // Enable delete vocabulary option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // MARK: - Test 1: Grammar Action -ed
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 24)
        pages.buttonActionsPage.createButtonForActions(button: 24, nameButton: "Grammar Action -ed")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add grammar action -ed
        pages.actionsPage.addANewAction(actionName: "Grammar Action")
        pages.grammarActionsPage.addActionED()
        
        // MARK: - Test 2: Grammar Action -en
        pages.buttonActionsPage.removeAButton(button: 26)
        pages.grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -en", actionType: "add -en", buttonNumber: 26)
        
        // MARK: - Test 3: Grammar Action -er
        pages.buttonActionsPage.removeAButton(button: 27)
        pages.grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -er", actionType: "add -er", buttonNumber: 27)
        
        // MARK: - Test 4: Grammar Action -est
        pages.buttonActionsPage.removeAButton(button: 28)
        pages.grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -est", actionType: "add -est", buttonNumber: 28)
        
        // MARK: - Test 5: Grammar Action -ing
        pages.buttonActionsPage.removeAButton(button: 29)
        pages.grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -ing", actionType: "add -ing", buttonNumber: 29)
        
        // MARK: - Test 6: Grammar Action -ly
        pages.buttonActionsPage.removeAButton(button: 30)
        pages.grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -ly", actionType: "add -ly", buttonNumber: 30)
        
        // MARK: - Test 7: Grammar Action -s
        pages.buttonActionsPage.removeAButton(button: 31)
        pages.grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -s", actionType: "add -s", buttonNumber: 31)
        
        // MARK: - Test 8: Create Verb and Adjective
        // Create a new button
        pages.grammarActionsPage.createAVerb()
        
        // Create an adjective
        pages.grammarActionsPage.createAnAdjective()
        
        // Check if the grammar action works as expected
        pages.grammarActionsPage.checkGrammarAction()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Create button Grammar Actions Test Finished Successfully!")
    }
} 