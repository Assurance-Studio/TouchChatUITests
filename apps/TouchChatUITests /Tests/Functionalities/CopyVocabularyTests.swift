import XCTest

final class CopyVocabularyTests: BaseTest {
    
    // MARK: - Test Configuration
    private let testVocabName = "copied vocabulary test"
    private let testVocabDescription = "vocabulary description e2e"
    
    func testCopyVocabulary() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Copy vocabulary using the main page functionality
        pages.mainPage.copy4BasicSS(vocabName: testVocabName, vocabDescription: testVocabDescription)
        
        // MARK: - Then (Verification)
        // Verify the vocabulary was copied successfully
        pages.mainPage.verifyTextExists(textVerified: testVocabDescription)
        
        // MARK: - Cleanup
        // Delete the copied vocabulary
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: testVocabDescription)
        
        print("Copy Vocabulary Test Finished Successfully!")
    }
} 