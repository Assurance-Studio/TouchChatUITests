//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower60Tests: BaseTest {
    
    func testWordPower60() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select WordPower60 vocabulary
        pages.vocabularyPage.selectWordPower()
        pages.vocabularyPage.selectWordPower60SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "out", vocabWord: "finish", vocabElement: 7, nameElement: "ACTIONS")
        XCTAssertTrue(app.buttons["the"].exists)
        app.buttons["the"].tap()
        app.buttons["and"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Finish ")

        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("WordPower 60 Test Finished Successfully!")
    }
} 
