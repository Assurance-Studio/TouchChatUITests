//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class MyQuickChatAdult12Tests: BaseTest {
    
    func testMyQuickChatAdult12() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select My QuickChat Adult 12 vocabulary
        pages.vocabularyPage.selectMyQuickChat()
        pages.vocabularyPage.selectMyQuickChatAdult12SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "Interact", vocabWord: "People", vocabElement: 11, nameElement: "Clothes")
        XCTAssertTrue(app.buttons["Daughter"].exists)
        app.buttons["Daughter"].tap()
        pages.common.checkSdbText(sdbText: "Daughter ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("My QuickChat Adult 12 Test Finished Successfully!")
    }
} 