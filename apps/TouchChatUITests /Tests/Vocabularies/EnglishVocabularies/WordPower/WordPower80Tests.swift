//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower80Tests: BaseTest {
    
    func testWordPower80() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select WordPower80 vocabulary
        pages.vocabularyPage.selectWordPower()
        pages.vocabularyPage.selectWordPower80SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "with", vocabWord: "is", vocabElement: 9, nameElement: "PLACES")
        XCTAssertTrue(app.buttons["eating"].exists)
        app.buttons["eating"].tap()
        app.buttons["the"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Is eating ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("WordPower 80 Test Finished Successfully!")
    }
} 