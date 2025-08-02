//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class WordPower108KeyboardTests: BaseTest {
    
    func testWordPower108Keyboard() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select WordPower108 Keyboard vocabulary
        pages.vocabularyPage.selectWordPower()
        pages.vocabularyPage.selectWordPower108KeyboardSS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "clear", vocabWord: "PEOPLE", vocabElement: 3, nameElement: "PEOPLE")
        XCTAssertTrue(app.buttons["mom"].exists)
        app.buttons["mom"].tap()
        app.buttons["T"].tap()
        app.buttons["E"].tap()
        app.buttons["S"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["more"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Mom ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("WordPower 108 Keyboard Test Finished Successfully!")
    }
} 