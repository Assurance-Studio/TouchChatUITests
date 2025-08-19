//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class Base4FrenchTests: BaseTest {
    
    func testBase4French() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select French language
        pages.languageSelectionPage.selectFrenchLanguage()
        pages.languageSelectionPage.selectFrenchVocabulary()
        
        // Select 4 de base français vocabulary
        pages.vocabularyPage.selectBase4French()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        pages.vocabularyPage.verifyTheVocab(lastElement: "TOUT SUR MOI", vocabWord: "Je veux", vocabElement: 3, nameElement: "Je veux")
        XCTAssertTrue(app.buttons["boire"].exists)
        app.buttons["boire"].tap()
        app.buttons["lait"].tap()
        app.buttons["BackButton"].tap()
        pages.common.checkSdbText(sdbText: "Je veux boire du ")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("Base 4 French Test Finished Successfully!")
    }
} 
