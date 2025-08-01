//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class VocabPCSpanishTests: BaseTest {
    
    func testVocabPCSpanish() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select Spanish language
        pages.languageSelectionPage.selectSpanishLanguage()
        pages.languageSelectionPage.selectSpanishVocabulary()
        
        // Select Vocab PC Spanish vocabulary
        pages.vocabularyPage.selectVocabPCSpanish()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
                
        pages.vocabularyPage.verifyTheVocab(lastElement: "tiempo", vocabWord: "quiero", vocabElement: 3, nameElement: "yo quiero")
        XCTAssertTrue(app.buttons["beber"].exists)
        app.buttons["beber"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Yo quiero buscar algo de ")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("VocabPC Spanish Test Finished Successfully!")
    }
} 
