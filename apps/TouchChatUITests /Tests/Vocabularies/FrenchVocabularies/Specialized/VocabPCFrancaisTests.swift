import XCTest

final class VocabPCFrancaisTests: BaseTest {
    
    func testVocabPCFrancais() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select French language
        pages.languageSelectionPage.selectFrenchLanguage()
        pages.languageSelectionPage.selectFrenchVocabulary()
        
        // Select VocabPC français vocabulary
        pages.vocabularyPage.selectVocabPCFrancais()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "temps", vocabWord: "Je suis", vocabElement: 3, nameElement: "Je veux")
        XCTAssertTrue(app.buttons["mélangé"].exists)
        app.buttons["mélangé"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Je suis ")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("VocabPC Francais Test Finished Successfully!")
    }
} 
