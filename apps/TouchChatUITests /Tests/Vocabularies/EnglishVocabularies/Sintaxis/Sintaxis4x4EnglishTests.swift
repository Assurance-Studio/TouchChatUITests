//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Sintaxis4x4EnglishTests: BaseTest {
    
    func testSintaxis4x4English() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select English language (default)
        // Select sin sintaxis 4 x 4 English vocabulary
        pages.vocabularyPage.selectSintaxis4x4English()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        // Verify vocabulary structure and test interactions
        pages.vocabularyPage.verifyTheVocab(lastElement: "Places", vocabWord: "Body Parts", vocabElement: 3, nameElement: "Food/Drink")
        XCTAssertTrue(app.buttons["eyes"].exists)
        app.buttons["eyes"].tap()
        app.buttons["nose"].tap()
        pages.common.checkSdbText(sdbText: "Eyes nose ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("Sintaxis 4x4 English Test Finished Successfully!")
    }
} 
