//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower25Tests: BaseTest {
    
    func testWordPower25() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        
        // Select WordPower25 vocabulary
        pages.vocabularyPage.selectWordPower()
        pages.vocabularyPage.selectWordPower25SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure
        pages.vocabularyPage.verifyTheVocab(
            lastElement: "stop",
            vocabWord: "I want",
            vocabElement: 4,
            nameElement: "clear"
        )
        
        // Test vocabulary interaction
        XCTAssertTrue(pages.vocabularyPage.verifyVocabularyElementExists("to eat"))
        pages.vocabularyPage.tapVocabularyElement("to eat")
        pages.vocabularyPage.tapVocabularyElement("cookies")
        
        // Verify speech display bar
        pages.vocabularyPage.checkSpeechDisplayBarText("I want to eat cookies ")
        
        // Navigate back
        pages.common.pressBackButton()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("WordPower 25 Test Finished Successfully!")
    }
} 
