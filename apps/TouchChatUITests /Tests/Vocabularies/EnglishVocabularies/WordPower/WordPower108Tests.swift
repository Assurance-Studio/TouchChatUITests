//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower108Tests: BaseTest {
    
    func testWordPower108() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select WordPower108 vocabulary
        pages.vocabularyPage.selectWordPower()
        pages.vocabularyPage.selectWordPower108SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "clear", vocabWord: "GROUPS", vocabElement: 24, nameElement: "GROUPS")
        XCTAssertTrue(app.buttons["BODY"].exists)
        app.buttons["BODY"].tap()
        app.buttons["hair"].tap()
        pages.common.checkSdbText(sdbText: "Hair ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("WordPower 108 Test Finished Successfully!")
    }
} 