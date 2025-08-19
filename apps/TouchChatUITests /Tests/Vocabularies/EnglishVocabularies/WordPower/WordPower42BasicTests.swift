//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower42BasicTests: BaseTest {
    
    func testWordPower42Basic() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select WordPower42 Basic vocabulary
        pages.vocabularyPage.selectWordPower()
        pages.vocabularyPage.selectWordPower42BasicSS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "clear", vocabWord: "PLACES", vocabElement: 7, nameElement: "TIME")
        XCTAssertTrue(app.buttons["restaurant"].exists)
        app.buttons["restaurant"].tap()
        app.buttons["can"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Restaurant ")

        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("WordPower 42 Basic Test Finished Successfully!")
    }
} 
