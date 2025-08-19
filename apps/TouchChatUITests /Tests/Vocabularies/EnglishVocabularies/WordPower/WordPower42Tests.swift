//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower42Tests: BaseTest {
    
    func testWordPower42() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select WordPower42 vocabulary
        pages.vocabularyPage.selectWordPower()
        pages.vocabularyPage.selectWordPower42SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "with", vocabWord: "go", vocabElement: 9, nameElement: "DESCRIBE")
        XCTAssertTrue(app.buttons["for a walk"].exists)
        app.buttons["for a walk"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Go for a walk ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("WordPower 42 Test Finished Successfully!")
    }
} 
