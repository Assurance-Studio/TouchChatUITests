//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower60EspanolBasicoTests: BaseTest {
    
    func testWordPower60EspanolBasico() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select Spanish language
        pages.languageSelectionPage.selectSpanishLanguage()
        pages.languageSelectionPage.selectSpanishVocabulary()
        
        // Select WordPower60 Español Básico vocabulary
        pages.vocabularyPage.selectWordPower60EspanolBasico()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "ya", vocabWord: "yo", vocabElement: 7, nameElement: "ACCIONES")
        XCTAssertTrue(app.buttons["espero"].exists)
        app.buttons["espero"].tap()
        app.buttons["la"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Espero ")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("WordPower 60 Espanol Basico Test Finished Successfully!")
    }
} 
