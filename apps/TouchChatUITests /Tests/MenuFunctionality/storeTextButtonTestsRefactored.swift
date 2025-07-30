import XCTest

final class storeTextButtonTestsRefactored: BaseTest {
    
    // MARK: - Test Configuration
    private let testVocabName = "copied vocabulary"
    private let testVocabDescription = "vocabulary description e2e"
    
    func testLaunchStoreTextButton() throws {
        // MARK: - Given (Test Setup)
        createSpellingTestVocabulary(name: testVocabName, description: testVocabDescription)
        
        pages.mainPage.openVocab(
            vocabToOpen: app.staticTexts[testVocabName], 
            vocab: testVocabName
        )
        
        // MARK: - When (Test Actions)
        // Enable delete vocab option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // Store text to a button
        pages.common.writeTestBy()
        pages.common.openStoreTextBtn()
        
        // Check if the store text button is displayed
        pages.common.checkIfTheStoreButtonWorks()
        
        // MARK: - Then (Verification)
        // Check if the word appears in Speech Display Bar
        pages.common.checkSdbText(sdbText: "TestbyTestby ")
        
        // MARK: - Cleanup
        cleanupTestVocabulary(name: testVocabName)
        
        print("Store Text Button function Test Finished with success!")
    }
} 