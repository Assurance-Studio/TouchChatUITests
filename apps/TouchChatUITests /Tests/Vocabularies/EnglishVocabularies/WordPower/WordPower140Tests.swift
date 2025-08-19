//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower140Tests: BaseTest {
    
    func testWordPower140() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select WordPower140 vocabulary
        pages.vocabularyPage.selectWordPower()
        pages.vocabularyPage.selectWordPower140SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "under", vocabWord: "I...", vocabElement: 4, nameElement: "I...")
        XCTAssertTrue(app.buttons["I am"].exists)
        app.buttons["I am"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "I am ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("WordPower 140 Test Finished Successfully!")
    }
} 