//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class MyQuickChatChild8Tests: BaseTest {
    
    func testMyQuickChatChild8() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select My QuickChat Child 8 vocabulary
        pages.vocabularyPage.selectMyQuickChat()
        pages.vocabularyPage.selectMyQuickChatChild8SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "Playing", vocabWord: "Greetings/Closings", vocabElement: 18, nameElement: "Greetings/Closings")
        XCTAssertTrue(app.buttons["Hey!"].exists)
        app.buttons["Hey!"].tap()
        pages.common.checkSdbText(sdbText: "Hey! ")

        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("My QuickChat Child 8 Test Finished Successfully!")
    }
} 
