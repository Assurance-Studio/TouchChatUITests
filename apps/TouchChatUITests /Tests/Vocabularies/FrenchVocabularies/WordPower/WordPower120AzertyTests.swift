import XCTest

final class WordPower120AzertyTests: BaseTest {
    
    func testWordPower120Azerty() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select French language
        pages.languageSelectionPage.selectFrenchLanguage()
        pages.languageSelectionPage.selectFrenchVocabulary()
        
        // Select WordPower120 français AZERTY vocabulary
        pages.vocabularyPage.selectWordPower120Azerty()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        pages.vocabularyPage.verifyTheVocab(lastElement: "efface tout", vocabWord: "je", vocabElement: 4, nameElement: "QUESTNS")
        XCTAssertTrue(app.buttons["'adore"].waitForExistence(timeout: 5), "Button 'adore' not found")
        app.buttons["'adore"].tap()
        pages.common.checkSdbText(sdbText: "J'adore ")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("WordPower 120 AZERTY Test Finished Successfully!")
    }
} 
