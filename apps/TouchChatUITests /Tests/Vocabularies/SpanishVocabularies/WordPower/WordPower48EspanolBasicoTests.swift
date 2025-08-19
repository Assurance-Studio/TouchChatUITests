//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower48EspanolBasicoTests: BaseTest {
    
    func testWordPower48EspanolBasico() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select Spanish language
        pages.languageSelectionPage.selectSpanishLanguage()
        pages.languageSelectionPage.selectSpanishVocabulary()
        
        // Select WordPower48 Español Básico vocabulary
        pages.vocabularyPage.selectWordPower48EspanolBasico()
        pages.common.openAVocab()
                
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "ven", vocabWord: "me", vocabElement: 5, nameElement: "GENTE")
        XCTAssertTrue(app.buttons["gusta"].exists)
        app.buttons["gusta"].tap()
        app.buttons["estar"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Me gusta ")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("WordPower 48 Espanol Basico Test Finished Successfully!")
    }
} 
