import XCTest

final class Sintaxis4x4SpanishTests: BaseTest {
    
    func testSintaxis4x4Spanish() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select Spanish language
        pages.languageSelectionPage.selectSpanishLanguage()
        pages.languageSelectionPage.selectSpanishVocabulary()
        
        // Select sin sintaxis 4 x 4 Spanish vocabulary
        pages.vocabularyPage.selectSintaxis4x4Spanish()
        pages.vocabularyPage.openVocabulary()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        // Note: Specific elements will need to be updated based on actual vocabulary content
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("Sintaxis 4x4 Spanish Test Finished Successfully!")
    }
} 