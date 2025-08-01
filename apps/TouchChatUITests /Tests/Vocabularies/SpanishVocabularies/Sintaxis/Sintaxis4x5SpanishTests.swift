import XCTest

final class Sintaxis4x5SpanishTests: BaseTest {
    
    func testSintaxis4x5Spanish() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select Spanish language
        pages.languageSelectionPage.selectSpanishLanguage()
        pages.languageSelectionPage.selectSpanishVocabulary()
        
        // Select sintaxis 4 x 5 Spanish vocabulary
        pages.vocabularyPage.selectSintaxis4x5Spanish()
        pages.vocabularyPage.openVocabulary()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        // Note: Specific elements will need to be updated based on actual vocabulary content
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("Sintaxis 4x5 Spanish Test Finished Successfully!")
    }
} 