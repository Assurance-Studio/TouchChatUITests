//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Sintaxis4x5SpanishTests: BaseTest {
    
    func testSintaxis4x5Spanish() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select Spanish language
        pages.languageSelectionPage.selectSpanishLanguage()
        pages.languageSelectionPage.selectSpanishVocabulary()
        
        // Select sintaxis 4 x 5 Spanish vocabulary
        pages.vocabularyPage.selectSintaxis4x5Spanish()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: " transporte", vocabWord: "comida", vocabElement: 4, nameElement: "lugares")
        XCTAssertTrue(app.buttons["pescado"].exists)
        app.buttons["pescado"].tap()
        app.buttons["pan"].tap()
        
        pages.common.checkSdbText(sdbText: "Pescado pan ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab();
        
        print("Sintaxis 4x5 Spanish Test Finished Successfully!")
    }
} 
