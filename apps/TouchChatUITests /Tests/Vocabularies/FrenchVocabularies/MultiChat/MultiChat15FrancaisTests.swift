import XCTest

final class MultiChat15FrancaisTests: BaseTest {
    
    func testMultiChat15Francais() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select French language
        pages.languageSelectionPage.selectFrenchLanguage()
        pages.languageSelectionPage.selectFrenchVocabulary()
        
        // Select MultiChat15 français vocabulary
        pages.vocabularyPage.selectMultiChat15Francais()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure
        pages.vocabularyPage.verifyTheVocab(
            lastElement: "Mon environnement",
            vocabWord: "J'ai besoin",
            vocabElement: 3,
            nameElement: "Questions "
        )
        
        // Test vocabulary interaction
        XCTAssertTrue(pages.vocabularyPage.verifyVocabularyElementExists("de prendre un pause"))
        pages.vocabularyPage.tapVocabularyElement("de prendre un pause")
        pages.vocabularyPage.tapBackButton()
        
        // Verify speech display bar
        pages.vocabularyPage.checkSpeechDisplayBarText("J'ai besoin de prendre une ")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("MultiChat 15 Francais Test Finished Successfully!")
    }
} 
