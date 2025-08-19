//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Basic4Tests: BaseTest {
    
    func testBasic4() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select Simple 4-Basic vocabulary
        pages.vocabularyPage.selectBasic4SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure
        pages.vocabularyPage.verifyTheVocab(
            lastElement: "ALL ABOUT ME",
            vocabWord: "I want",
            vocabElement: 3,
            nameElement: "I want"
        )
        
        // Test vocabulary interaction
        XCTAssertTrue(pages.vocabularyPage.verifyVocabularyElementExists("to eat"))
        pages.vocabularyPage.tapVocabularyElement("to eat")
        pages.vocabularyPage.tapBackButton()
        pages.vocabularyPage.tapBackButton()
        
        // Verify speech display bar
        pages.vocabularyPage.checkSpeechDisplayBarText("I want ")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("Basic 4 Test Finished Successfully!")
    }
} 
