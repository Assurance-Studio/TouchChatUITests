//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class MultiChat15AdultTests: BaseTest {
    
    func testMultiChat15Adult() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select MultiChat15 Adult vocabulary
        pages.vocabularyPage.selectMultiChat15AdultSS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "Shopping", vocabWord: "I want", vocabElement: 10, nameElement: "I don't want")
        XCTAssertTrue(app.buttons["to watch"].exists)
        app.buttons["to watch"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "I want ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("MultiChat 15 Adult Test Finished Successfully!")
    }
} 
