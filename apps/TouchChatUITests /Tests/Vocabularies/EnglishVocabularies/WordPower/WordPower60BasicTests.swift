//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower60BasicTests: BaseTest {
    
    func testWordPower60Basic() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select WordPower60 Basic vocabulary
        pages.vocabularyPage.selectWordPower()
        pages.vocabularyPage.selectWordPower60BasicSS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "with", vocabWord: "it", vocabElement: 9, nameElement: "SOCIAL")
        XCTAssertTrue(app.buttons["help"].exists)
        app.buttons["help"].tap() 
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "It ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("WordPower 60 Basic Test Finished Successfully!")
    }
} 