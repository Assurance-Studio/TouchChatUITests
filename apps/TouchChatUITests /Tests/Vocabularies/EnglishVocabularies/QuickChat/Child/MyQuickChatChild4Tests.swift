//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class MyQuickChatChild4Tests: BaseTest {
    
    func testMyQuickChatChild4() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select My QuickChat Child 4 vocabulary
        pages.vocabularyPage.selectMyQuickChat()
        pages.vocabularyPage.selectMyQuickChatChild4SS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "Greetings/Closings", vocabWord: "Playing", vocabElement: 18, nameElement: "Greetings/Closings")
        XCTAssertTrue(app.buttons["Can I play?"].exists)
        app.buttons["Can I play?"].tap()
        pages.common.checkSdbText(sdbText: "Can I play? ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("My QuickChat Child 4 Test Finished Successfully!")
    }
} 
