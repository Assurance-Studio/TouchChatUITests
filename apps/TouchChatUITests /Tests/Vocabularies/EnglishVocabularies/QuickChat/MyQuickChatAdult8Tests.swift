//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class MyQuickChatAdult8Tests: BaseTest {
    
    func testMyQuickChatAdult8() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select My QuickChat Adult 8 vocabulary
        pages.vocabularyPage.selectMyQuickChat()
        pages.vocabularyPage.selectMyQuickChatAdult8SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "Interact", vocabWord: "Emotions", vocabElement: 8, nameElement: "Break")   
        XCTAssertTrue(app.buttons["Happy"].exists)
        app.buttons["Happy"].tap()
        pages.common.checkSdbText(sdbText: "I'm happy. ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("My QuickChat Adult 8 Test Finished Successfully!")
    }
} 
