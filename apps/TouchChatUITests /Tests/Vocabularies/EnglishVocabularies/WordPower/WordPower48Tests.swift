//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower48Tests: BaseTest {
    
    func testWordPower48() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select WordPower48 vocabulary
        pages.vocabularyPage.selectWordPower()
        pages.vocabularyPage.selectWordPower48SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "with", vocabWord: "come", vocabElement: 9, nameElement: "GROUPS")
        XCTAssertTrue(app.buttons["back"].exists)
        app.buttons["back"].tap()
        app.buttons["to"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Come back to ")

        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("WordPower 48 Test Finished Successfully!")
    }
} 
