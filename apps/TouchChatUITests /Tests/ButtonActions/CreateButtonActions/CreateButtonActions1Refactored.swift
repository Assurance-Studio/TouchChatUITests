import XCTest

final class CreateButtonActions1Refactored: BaseTest {
    
    func testCreateButtonActions1() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        let vocabularyName = "Create Button Actions 1 Vocabulary"
        let vocabularyDesc = "Vocabulary Description by e2e"
        
        // MARK: - When (Test Actions)
        // Copy a new vocabulary
        pages.mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        pages.mainPage.openVocab(vocab: vocabularyName)
        
        // Enable delete vocabulary option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // MARK: - Test 1: Add Time/Date Action
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 22)
        pages.buttonActionsPage.createButtonForActions(button: 22, nameButton: "Add Action Time/Date")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add time action
        pages.actionsPage.addANewAction(actionName: "Add Time/Date")
        pages.buttonActionsPage.addTimeDateAction(actionType: "Date and Time")
        
        // Check if the action works as expected
        pages.buttonActionsPage.checkIfTheDateTimeAreDisplayed()
        app.buttons["CLEAR "].tap()
        
        // MARK: - Test 2: Add Message To Display Action
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 24)
        pages.buttonActionsPage.createButtonForActions(button: 24, nameButton: "Add Message To Display")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add message to display
        pages.actionsPage.addANewAction(actionName: "Add Message to Display")
        
        // Check if the action works as expected
        pages.buttonActionsPage.checkAddMessageDisplay()
        app.buttons["CLEAR "].tap()
        
        // MARK: - Test 3: BackSpace Key Action
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 25)
        pages.buttonActionsPage.createButtonForActions(button: 25, nameButton: "Backspace Key")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add backspace key action
        pages.actionsPage.addANewAction(actionName: "Backspace Key")
        
        // Save the action
        pages.actionsPage.saveTheAction()
        
        // Check if the action works as expected
        pages.buttonActionsPage.checkIfTheActionsWorks()
        app.buttons["CLEAR "].tap()
        
        // MARK: - Test 4: Clear Display Action
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 26)
        pages.buttonActionsPage.createButtonForActions(button: 26, nameButton: "Clear Display")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add clear display action
        pages.actionsPage.addANewAction(actionName: "Clear Display")
        
        // Save the action
        pages.actionsPage.saveTheAction()
        
        // Check if the action works as expected
        pages.buttonActionsPage.clearDisplay()
        
        // MARK: - Test 5: Battery Status Action
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 27)
        pages.buttonActionsPage.createButtonForActions(button: 27, nameButton: "Battery Sts")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add battery status action
        pages.actionsPage.addANewAction(actionName: "Battery Status")
        
        // Save the action
        pages.actionsPage.saveTheAction()
        
        // Check if the action works
        pages.buttonActionsPage.checkTheBatteryStatus()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Create button actions1 Test Finished Successfully!")
    }
} 
