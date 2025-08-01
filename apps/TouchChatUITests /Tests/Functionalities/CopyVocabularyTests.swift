import XCTest

final class CopyVocabularyTests: BaseTest {
    
    // MARK: - Test Configuration
    private let vocabularyName = "Copy A Vocabulary Test"
    private let testVocabDescription = "Vocabulary description created by e2e"
    
    func testCopyVocabulary() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Copy vocabulary using the main page functionality
        pages.mainPage.copy4BasicSS(vocabName: vocabularyName, vocabDescription: testVocabDescription)
        
        // Enable delete vocab option
        pages.mainPage.openVocab(vocab: vocabularyName)
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        pages.common.backToVocab()
        
        // MARK: - Then (Verification)
        // Verify the vocabulary was copied successfully
        pages.mainPage.verifyTextExists(textVerified: testVocabDescription)
        
        // MARK: - Cleanup
        // Delete the copied vocabulary
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: testVocabDescription)
        
        print("Copy Vocabulary Test Finished Successfully!")
    }
}
