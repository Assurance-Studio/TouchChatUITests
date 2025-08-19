import XCTest

final class CreateButtonActions3Refactored: BaseTest {
    
    func testCreateButtonActions3() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        let vocabularyName = "Create Button Actions 3 Vocabulary"
        let vocabularyDesc = "Vocabulary Description by e2e"
        
        // MARK: - When (Test Actions)
        // Copy a new vocabulary
        pages.mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        pages.mainPage.openVocab(vocab: vocabularyName)
        
        // Enable delete vocabulary option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // MARK: - Test 1: Add Action Time
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 43)
        pages.buttonActionsPage.createButtonForActions(button: 43, nameButton: "Add Action Time")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add time action
        pages.actionsPage.addANewAction(actionName: "Add Time/Date")
        pages.buttonActionsPage.addTimeDateAction(actionType: "Time Only")
        
        // Check if the action works
        pages.buttonActionsPage.checkIfTheTimeisDisplayed()
        app.buttons["CLEAR "].tap()
        
        // MARK: - Test 2: Word Finder Button
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 44)
        pages.buttonActionsPage.createButtonForActions(button: 44, nameButton: "Word Finder Btn")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add a new action "Text Copy"
        pages.actionsPage.addANewAction(actionName: "Word Finder")
        pages.actionsPage.saveTheAction()
        
        // Check the Word Finder action
        pages.actionsPage.checkWordFinderAction()
        
        // MARK: - Test 3: Data Logging
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 45)
        pages.buttonActionsPage.createButtonForActions(button: 45, nameButton: "Data Logging")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add data logging action
        pages.actionsPage.addANewAction(actionName: "Data Logging On/Off")
        
        // Save the action
        pages.actionsPage.saveTheAction()
        
        // Check if the action works
        pages.buttonActionsPage.checkLoggingData()
        
        // MARK: - Test 4: Cancel Visit
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 46)
        pages.buttonActionsPage.createButtonForActions(button: 46, nameButton: "Cancel Visit")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add cancel visit action
        pages.actionsPage.addANewAction(actionName: "Cancel Visit")
        
        // Save the action
        pages.actionsPage.saveTheAction()
        
        // Check if the action works
        app.buttons["Cancel Visit"].tap()
        
        // MARK: - Test 5: System Keyboard
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 47)
        pages.buttonActionsPage.createButtonForActions(button: 47, nameButton: "System Keyboard")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add system keyboard action
        pages.actionsPage.addANewAction(actionName: "System Keyboard")
        
        // Save the action
        pages.actionsPage.saveTheAction()
        
        // Check if the action works
        pages.actionsPage.checkSystemKeyboardAction()
        
        // MARK: - Test 6: Texting Conversations
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 48)
        pages.buttonActionsPage.createButtonForActions(button: 48, nameButton: "Texting Conversations")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add texting conversations action
        pages.actionsPage.addANewAction(actionName: "Texting - Navigate to Conversations")
        
        // Save the action
        pages.actionsPage.saveTheAction()
        
        // Check if the action works
        pages.actionsPage.checkIfTheTextingConversationsWorks()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Create button actions3 Test Finished Successfully!")
    }
} 
