//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower25EspanolTests: BaseTest {
    
    func testWordPower25Espanol() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select Spanish language
        pages.languageSelectionPage.selectSpanishLanguage()
        pages.languageSelectionPage.selectSpanishVocabulary()
        
        // Select WordPower25 Español vocabulary
        pages.vocabularyPage.selectWordPower25Espanol()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure
        
        pages.vocabularyPage.verifyVocabulary(
            lastElement: "jugar",
            vocabWord: "toma",
            vocabElement: 4,
            nameElement: "borrar"
        )
        
        // Test vocabulary interaction
        XCTAssertTrue(pages.vocabularyPage.verifyVocabularyElementExists("una foto"))
        pages.vocabularyPage.tapVocabularyElement("una foto")
        pages.vocabularyPage.tapBackButton()
        
        // Verify speech display bar
        pages.vocabularyPage.verifySpeechDisplayBarText(expectedText:"Toma una ")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("WordPower 25 Espanol Test Finished Successfully!")
    }
} 
