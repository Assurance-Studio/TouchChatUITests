import XCTest

final class VocabPCTests: BaseTest {
    
    func testVocabPC() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select VocabPC vocabulary
        pages.vocabularyPage.selectVocabPCSS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "time", vocabWord: "I feel", vocabElement: 3, nameElement: "I want")
        XCTAssertTrue(app.buttons["confused"].exists)
        app.buttons["confused"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "I feel ")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("VocabPC Test Finished Successfully!")
    }
} 
