//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Sintaxis4x4SpanishTests: BaseTest {
    
    func testSintaxis4x4Spanish() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select Spanish language
        pages.languageSelectionPage.selectSpanishLanguage()
        pages.languageSelectionPage.selectSpanishVocabulary()
        
        // Select sin sintaxis 4 x 4 Spanish vocabulary
        pages.vocabularyPage.selectSintaxis4x4Spanish()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "lugares", vocabWord: "casa", vocabElement: 3, nameElement: "comida")
        XCTAssertTrue(app.buttons["cochera"].exists)
        app.buttons["cochera"].tap()
        app.buttons["sala"].tap()
        pages.common.checkSdbText(sdbText: "Cochera sala ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("Sintaxis 4x4 Spanish Test Finished Successfully!")
    }
} 
