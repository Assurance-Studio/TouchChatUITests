//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Sintaxis4x5EnglishTests: BaseTest {
    
    func testSintaxis4x5English() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select sintaxis 4 x 5 English vocabulary
        pages.vocabularyPage.selectSintaxis4x5English()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "Transportation", vocabWord: "Toys", vocabElement: 3, nameElement: "People")
        XCTAssertTrue(app.buttons["Buy me"].exists)
        app.buttons["Buy me"].tap()
        pages.common.checkSdbText(sdbText: "Buy me ")
    
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("Sintaxis 4x5 English Test Finished Successfully!")
    }
} 
