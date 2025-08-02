//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class MyCoreTests: BaseTest {
    
    func testMyCore() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)        
        // Select MyCore vocabulary
        pages.vocabularyPage.selectMyCoreSS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "with", vocabWord: "are", vocabElement: 3, nameElement: "myQuickChat")
        XCTAssertTrue(app.buttons["eating"].exists)
        app.buttons["eating"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Are ")

        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("MyCore Test Finished Successfully!")
    }
} 
