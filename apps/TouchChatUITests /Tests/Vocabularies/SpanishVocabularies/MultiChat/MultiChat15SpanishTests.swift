import XCTest

final class MultiChat15SpanishTests: BaseTest {
    
    func testMultiChat15Spanish() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select Spanish language
        pages.languageSelectionPage.selectSpanishLanguage()
        pages.languageSelectionPage.selectSpanishVocabulary()
        
        // Select MultiChat15 Spanish vocabulary
        pages.vocabularyPage.selectMultiChat15Spanish()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "Mis escenas ", vocabWord: "Yo necesito", vocabElement: 4, nameElement: "Personas")
        XCTAssertTrue(app.buttons["ir a la oficina"].exists)
        app.buttons["ir a la oficina"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Yo necesito ir a la ")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("MultiChat 15 Spanish Test Finished Successfully!")
    }
} 
