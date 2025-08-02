//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class MyQuickChatChild12Tests: BaseTest {
    
    func testMyQuickChatChild12() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select My QuickChat Child 12 vocabulary
        pages.vocabularyPage.selectMyQuickChat()
        pages.vocabularyPage.selectMyQuickChatChild12SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "Playing", vocabWord: "Drinks", vocabElement: 14, nameElement: "Places")
        XCTAssertTrue(app.buttons["Lemonade"].exists)
        app.buttons["Lemonade"].tap()
        pages.common.checkSdbText(sdbText: "I want some lemonade. ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("My QuickChat Child 12 Test Finished Successfully!")
    }
} 