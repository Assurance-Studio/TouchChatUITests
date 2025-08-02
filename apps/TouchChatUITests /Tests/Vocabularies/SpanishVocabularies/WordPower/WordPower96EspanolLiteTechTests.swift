//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower96EspanolLiteTechTests: BaseTest {
    
    func testWordPower96EspanolLiteTech() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select Spanish language
        pages.languageSelectionPage.selectSpanishLanguage()
        pages.languageSelectionPage.selectSpanishVocabulary()
        
        // Select WordPower96 Español Lite-Tech vocabulary
        pages.vocabularyPage.selectWordPower96EspanolLiteTech()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "ya", vocabWord: "yo mi", vocabElement: 8, nameElement: "ACCIONES")
        XCTAssertTrue(app.buttons["comer"].exists)
        app.buttons["comer"].tap()
        app.buttons["la"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Yo comer ")
        pages.common.backToVocab();

        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("WordPower 96 Espanol Lite-Tech Test Finished Successfully!")
    }
} 
