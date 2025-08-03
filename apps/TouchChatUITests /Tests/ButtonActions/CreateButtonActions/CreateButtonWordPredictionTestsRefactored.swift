import XCTest

final class CreateButtonWordPredictionTestsRefactored: BaseTest {
    
    func testCreateWordPrediction() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        let vocabularyName = "Create Button Word Prediction Vocabulary"
        let vocabularyDesc = "Vocabulary Description by e2e"
        
        // MARK: - When (Test Actions)
        // Copy a new vocabulary
        pages.mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        pages.waitPage.waitShort()
        pages.mainPage.openVocab(vocab: vocabularyName)
        
        // Enable delete vocabulary option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // MARK: - Test 1: Word Prediction Button 1
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 25)
        pages.buttonActionsPage.createButtonForActions(button: 25, nameButton: "Word Prediction Btn 1")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add word prediction action
        pages.actionsPage.addANewAction(actionName: "Word Prediction")
        app.staticTexts["  Number 1"].tap()
        app.buttons["Save"].tap()
        
        // MARK: - Test 2-10: Word Prediction Buttons 2-10
        // Word Prediction Button 2
        pages.buttonActionsPage.removeAButton(button: 26)
        pages.grammarActionsPage.createButtonWordPrediction(button: 26, navigateDirection: "Word Prediction Btn 2", actionType: "Word Prediction", directionType: "  Number 2")
        
        // Word Prediction Button 3
        pages.buttonActionsPage.removeAButton(button: 27)
        pages.grammarActionsPage.createButtonWordPrediction(button: 27, navigateDirection: "Word Prediction Btn 3", actionType: "Word Prediction", directionType: "  Number 3")
        
        // Word Prediction Button 4
        pages.buttonActionsPage.removeAButton(button: 28)
        pages.grammarActionsPage.createButtonWordPrediction(button: 28, navigateDirection: "Word Prediction Btn 4", actionType: "Word Prediction", directionType: "  Number 4")
        
        // Word Prediction Button 5
        pages.buttonActionsPage.removeAButton(button: 22)
        pages.grammarActionsPage.createButtonWordPrediction(button: 22, navigateDirection: "Word Prediction Btn 5", actionType: "Word Prediction", directionType: "  Number 5")
        
        // Word Prediction Button 6
        pages.buttonActionsPage.removeAButton(button: 23)
        pages.grammarActionsPage.createButtonWordPrediction(button: 23, navigateDirection: "Word Prediction Btn 6", actionType: "Word Prediction", directionType: "  Number 6")
        
        // Word Prediction Button 7
        pages.buttonActionsPage.removeAButton(button: 24)
        pages.grammarActionsPage.createButtonWordPrediction(button: 24, navigateDirection: "Word Prediction Btn 7", actionType: "Word Prediction", directionType: "  Number 7")
        
        // Word Prediction Button 8
        pages.buttonActionsPage.removeAButton(button: 29)
        pages.grammarActionsPage.createButtonWordPrediction(button: 29, navigateDirection: "Word Prediction Btn 8", actionType: "Word Prediction", directionType: "  Number 8")
        
        // Word Prediction Button 9
        pages.buttonActionsPage.removeAButton(button: 30)
        pages.grammarActionsPage.createButtonWordPrediction(button: 30, navigateDirection: "Word Prediction Btn 9", actionType: "Word Prediction", directionType: "  Number 9")
        
        // Word Prediction Button 10
        pages.buttonActionsPage.removeAButton(button: 31)
        pages.grammarActionsPage.createButtonWordPrediction(button: 31, navigateDirection: "Word Prediction Btn 10", actionType: "Word Prediction", directionType: "  Number 10")
        
        // Check word predictions action
        pages.actionsPage.checkWordPredictionsAction()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Create Button Word Prediction Test Finished Successfully!")
    }
} 