import XCTest

final class editPronunciationsTestsRefactored: BaseTest {
    
    func testLaunchEditPronunciations() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // Open Spelling SS vocabulary
        pages.common.spellingSS.tap()
        pages.common.openAVocab()
        
        // MARK: - When (Test Actions)
        // Add pronunciations
        pages.pronunciationsPage.reachEditPronunciations()
        pages.pronunciationsPage.addPronunciations()
        
        // Edit and delete pronunciations
        pages.pronunciationsPage.scrollForSearchPronunciations()
        pages.pronunciationsPage.searchPronunciations()
        pages.pronunciationsPage.deletePronunciations()
        
        // Clear all pronunciations
        pages.pronunciationsPage.clearAllPronunciations()
        
        // Restore to defaults
        pages.pronunciationsPage.restoreToDefaultsPronunciations()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("Edit Pronunciations Test Finished with success!")
    }
} 