//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower120FrancaisTests: BaseTest {
    
    func testWordPower120Francais() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select French language
        pages.languageSelectionPage.selectFrenchLanguage()
        pages.languageSelectionPage.selectFrenchVocabulary()
        
        // Select WordPower120 français vocabulary
        pages.vocabularyPage.selectWordPower120Francais()
        pages.common.openAVocab()

        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "efface tout", vocabWord: "tu", vocabElement: 4, nameElement: "QUESTNS")
        XCTAssertTrue(app.buttons["espères"].waitForExistence(timeout: 5), "espères button not found")
        app.buttons["espères"].tap()
        pages.common.checkSdbText(sdbText: "Tu espères ")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("WordPower 120 Francais Test Finished Successfully!")
    }
} 
