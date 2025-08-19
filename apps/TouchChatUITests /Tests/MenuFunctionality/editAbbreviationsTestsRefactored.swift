import XCTest

final class editAbbreviationsTestsRefactored: BaseTest {
    
    func testLaunchEditAbbreviations() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // Open Spelling SS vocabulary
        pages.common.spellingSS.tap()
        pages.common.openAVocab()
        
        // MARK: - When (Test Actions)
        // Add abbreviation
        pages.abbreviationsPage.reachAddAbbreviation()
        pages.abbreviationsPage.addAbbreviation()
        pages.abbreviationsPage.checkAddAbbreviation()
        pages.common.checkSdbText(sdbText: "Test by e2e ")
        
        // Edit and delete abbreviation
        pages.abbreviationsPage.reachToEditAbbreviation()
        pages.abbreviationsPage.removeTheAbbreviation()
        
        // Clear all abbreviations
        pages.abbreviationsPage.reachToEditAbbreviation()
        pages.abbreviationsPage.clearAllAbbreviations()
        
        // Restore to defaults
        pages.abbreviationsPage.restoreToDefaultsAbbreviation()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("Edit Abbreviations Test Finished with success!")
    }
} 