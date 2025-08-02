//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class AphasiaUSTests: BaseTest {
    
    func testAphasiaUS() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select Aphasia US vocabulary
        pages.vocabularyPage.selectAphasiaUSSS()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "Scales", vocabWord: "Me", vocabElement: 10, nameElement: "Clear")
        app.buttons["Feelings"].tap()
        XCTAssertTrue(app.buttons["happy"].exists)
        app.buttons["happy"].tap()
        pages.common.checkSdbText(sdbText: "Happy ")
        pages.common.pressBackButton()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("Aphasia US Test Finished Successfully!")
    }
} 
