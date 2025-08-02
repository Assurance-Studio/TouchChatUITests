//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class EngageForiOSTests: BaseTest {
    
    func testEngageForiOS() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select Engage for iOS vocabulary
        pages.vocabularyPage.selectEngageForiOS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "i", vocabWord: "2 BUTTONS", vocabElement: 3, nameElement: "PRACTICE")
        XCTAssertTrue(app.buttons["Feelings"].exists)
        app.buttons["Feelings"].tap()
        app.buttons["happy"].tap()
        pages.common.checkSdbText(sdbText: "Happy ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("Engage for iOS Test Finished Successfully!")
    }
} 
