//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower60FrancaisTests: BaseTest {
    
    func testWordPower60Francais() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select French language
        pages.languageSelectionPage.selectFrenchLanguage()
        pages.languageSelectionPage.selectFrenchVocabulary()
        
        // Select WordPower60 français vocabulary
        pages.vocabularyPage.selectWordPower60Francais()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure
        pages.vocabularyPage.verifyTheVocab(
            lastElement: "tout",
            vocabWord: "je",
            vocabElement: 4,
            nameElement: "ABC 123"
        )
        
        // Test vocabulary interaction
        XCTAssertTrue(pages.vocabularyPage.verifyVocabularyElementExists("donne"))
        pages.vocabularyPage.tapVocabularyElement("donne")
        pages.vocabularyPage.tapBackButton()
        
        // Verify speech display bar
        pages.vocabularyPage.checkSpeechDisplayBarText("Je ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("WordPower 60 Francais Test Finished Successfully!")
    }
} 
