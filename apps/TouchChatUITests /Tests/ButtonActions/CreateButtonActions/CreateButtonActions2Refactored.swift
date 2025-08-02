import XCTest

final class CreateButtonActions2Refactored: BaseTest {
    
    func testCreateButtonActions2() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        let vocabularyName = "copied vocabulary create button actions2"
        let vocabularyDesc = "vocabulary description e2e"
        
        // MARK: - When (Test Actions)
        // Copy a new vocabulary
        pages.mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        pages.mainPage.openVocab(vocab: vocabularyName)
        
        // Enable delete vocabulary option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // MARK: - Test 1: Clear Last Word Action
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 28)
        pages.buttonActionsPage.createButtonForActions(button: 28, nameButton: "Clear Last Word")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add clear last word action
        pages.actionsPage.addANewAction(actionName: "Clear Last Word")
        
        // Save the action
        pages.actionsPage.saveTheAction()
        
        // Check if the action works
        pages.buttonActionsPage.clearLastWord()
        app.buttons["CLEAR "].tap()
        
        // MARK: - Test 2: Calculator Action
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 29)
        pages.buttonActionsPage.createButtonForActions(button: 29, nameButton: "Calculator")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add calculator action
        pages.actionsPage.addANewAction(actionName: "Calculator")
        
        // Save the action
        pages.actionsPage.saveTheAction()
        
        // Check if the action works
        pages.buttonActionsPage.checkTheCalculatorAction()
        
        // MARK: - Test 3: Help Signal Action
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 30)
        pages.buttonActionsPage.createButtonForActions(button: 30, nameButton: "Help Signal")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add help signal action
        pages.actionsPage.addANewAction(actionName: "Help Signal")
        
        // Save the action
        pages.actionsPage.saveTheAction()
        
        // Check if the action works
        app.buttons["Help Signal"].tap()
        
        // MARK: - Test 4: Play YouTube Video Action
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 31)
        pages.buttonActionsPage.createButtonForActions(button: 31, nameButton: "Play YouTube Video")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add no animation action
        pages.actionsPage.addANewAction(actionName: "Play Video")
        
        // Check Library Video tab
        pages.actionsPage.checkLibraryVideoTab()
        
        // Check youtube video tab and insert a video
        pages.actionsPage.checkYoutubeVideoTab()
        
        // Check if the action works as expected
        pages.actionsPage.checkYoutubeVideoBtn()
        
        // MARK: - Test 5: Add Action Date
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 42)
        pages.buttonActionsPage.createButtonForActions(button: 42, nameButton: "Add Action Date")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add time/date action
        pages.actionsPage.addANewAction(actionName: "Add Time/Date")
        pages.buttonActionsPage.addTimeDateAction(actionType: "Date Only")
        
        // Check if the action works
        pages.buttonActionsPage.checkIfTheDateisDisplayed()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Create button actions2 Test Finished Successfully!")
    }
} 