//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower48EspanolTests: BaseTest {
    
    func testWordPower48Espanol() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select Spanish language
        pages.languageSelectionPage.selectSpanishLanguage()
        pages.languageSelectionPage.selectSpanishVocabulary()
        
        // Select WordPower48 Español vocabulary
        pages.vocabularyPage.selectWordPower48Espanol()
        pages.common.openAVocab()

        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "porque", vocabWord: "comer", vocabElement: 4, nameElement: "GENTE")
        XCTAssertTrue(app.buttons["que"].exists)
        app.buttons["que"].tap()
        app.buttons["el"].tap()
        pages.common.checkSdbText(sdbText: "Comer que el ")

        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("WordPower 48 Espanol Test Finished Successfully!")
    }
} 
