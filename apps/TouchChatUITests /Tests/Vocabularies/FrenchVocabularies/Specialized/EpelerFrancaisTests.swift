//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class EpelerFrancaisTests: BaseTest {
    
    func testEpelerFrancais() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select French language
        pages.languageSelectionPage.selectFrenchLanguage()
        pages.languageSelectionPage.selectFrenchVocabulary()
        
        // Select Épeler français vocabulary
        pages.vocabularyPage.selectEpelerFrancais()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        pages.vocabularyPage.verifyTheVocab(lastElement: "?", vocabWord: "PHRASES", vocabElement: 6, nameElement: "PHRASES")
        XCTAssertTrue(app.buttons["Bonjour!"].exists)
        app.buttons["Bonjour!"].tap()
        pages.common.checkSdbText(sdbText: "Bonjour, comment-allez vous? ")
    
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("Epeler Francais Test Finished Successfully!")
    }
} 
