import XCTest

final class AphasiaUKTests: BaseTest {
    
    func testAphasiaUK() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select Aphasia UK vocabulary
        pages.vocabularyPage.selectAphasiaUKSS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "Scales", vocabWord: "Places", vocabElement: 7, nameElement: "Social")
        app.buttons["Shopping"].tap()
        XCTAssertTrue(app.buttons["supermarket "].exists)
        app.buttons["supermarket "].tap()
        pages.common.checkSdbText(sdbText: "Supermarket ")
        pages.common.pressBackButton()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("Aphasia UK Test Finished Successfully!")
    }
} 
