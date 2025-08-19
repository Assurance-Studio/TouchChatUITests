//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class SpellingTests: BaseTest {
    
    func testSpelling() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select Spelling vocabulary
        pages.vocabularyPage.selectSpellingSS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "BACKSPACE", vocabWord: "PHRASES", vocabElement: 5, nameElement: "TEXTING")
       
        XCTAssertTrue(app.buttons["Good Morning"].exists)
        app.buttons["Good Morning"].tap()
        pages.common.checkSdbText(sdbText: "Good morning, how are you? ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("Spelling Test Finished Successfully!")
    }
} 
