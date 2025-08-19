//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class CommunicationJourneyTests: BaseTest {
    
    func testCommunicationJourney() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Select French language
        pages.languageSelectionPage.selectFrenchLanguage()
        pages.languageSelectionPage.selectFrenchVocabulary()
        
        // Select Communication Journey Aphasie français vocabulary
        pages.vocabularyPage.selectCommunicationFrancais()
        pages.common.openAVocab()
        
        // MARK: - Then (Verification)
        pages.vocabularyPage.verifyTheVocab(lastElement: "Échelles", vocabWord: "Social", vocabElement: 3, nameElement: "Objets")
        XCTAssertTrue(app.buttons["Comment ça va?"].exists)
        app.buttons["Comment ça va?"].tap()
        pages.common.checkSdbText(sdbText: "Comment ça va? ")
        
        // MARK: - Cleanup
        pages.common.pressBackButton()
        pages.common.backToVocab()
        
        print("Communication Journey Test Finished Successfully!")
    }
} 
