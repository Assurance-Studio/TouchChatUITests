import XCTest

final class MultiChat15BilingualTests: BaseTest {
    
    func testMultiChat15Bilingual() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select Spanish language
        pages.languageSelectionPage.selectSpanishLanguage()
        pages.languageSelectionPage.selectSpanishVocabulary()
        
        // Select MultiChat 15 Spanish Bilingual vocabulary
        pages.vocabularyPage.selectMultiChat15Bilingual()
        pages.vocabularyPage.openVocabulary()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure
        pages.vocabularyPage.verifyVocabulary(
            lastElement: "Mis escenas - My Scenes",
            vocabWord: "Yo quiero - I want",
            vocabElement: 3,
            nameElement: "Preguntas - Questions"
        )
        
        // Test vocabulary interaction
        XCTAssertTrue(pages.vocabularyPage.verifyVocabularyElementExists("comer - to eat"))
        pages.vocabularyPage.tapVocabularyElement("comer - to eat")
        pages.vocabularyPage.tapVocabularyElement("FRUTA - FRUIT")
        pages.vocabularyPage.tapVocabularyElement("uvas - grapes")
        
        // Verify speech display bar
        pages.vocabularyPage.verifySpeechDisplayBarText("Yo quiero comer uvas ")
        
        // Navigate back
        pages.vocabularyPage.tapBackButton()
        pages.vocabularyPage.tapBackButton()
        pages.vocabularyPage.tapBackButton()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("MultiChat 15 Bilingual Test Finished Successfully!")
    }
} 