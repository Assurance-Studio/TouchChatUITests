//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class MultiChat15StudentTests: BaseTest {
    
    func testMultiChat15Student() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select MultiChat15 Student vocabulary
        pages.vocabularyPage.selectMultiChat15StudentSS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "My Scenes", vocabWord: "I don't want", vocabElement: 11, nameElement: "I need")
        XCTAssertTrue(app.buttons["to wear"].exists)
        app.buttons["to wear"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "I don't want ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("MultiChat 15 Student Test Finished Successfully!")
    }
} 
