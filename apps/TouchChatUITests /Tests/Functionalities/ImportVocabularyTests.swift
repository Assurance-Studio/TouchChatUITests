import XCTest

final class ImportVocabularyTests: BaseTest {
    
    // MARK: - Test Configuration
    private let dropBoxEmail = "e2e.empower@gmail.com"
    private let dropBoxPassword = "Testtableta01@"
    private let testFileName = "000_newvmodifiers.ce"
    private let testDescription = "gotomodif"
    
    func testImportVocabularyFromDropBox() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Navigate to import vocabulary
        pages.vocabPage.menuButton.tap()
        
        // Import from DropBox
        pages.functionalityPage.importFromDropBox()
        
        // Login to DropBox
        pages.functionalityPage.loginToDropBox(
            email: dropBoxEmail,
            password: dropBoxPassword
        )
        
        // Select and import file
        pages.functionalityPage.selectAndImportFile(
            fileName: testFileName,
            description: testDescription
        )
        
        // MARK: - Then (Verification)
        // Open the modifiers vocabulary
        pages.modifiersPage.openModifiersVocab()
        
        // Test the FN modifiers
        pages.modifiersPage.testFnRow1()
        pages.modifiersPage.testFnRow2()
        pages.modifiersPage.testFnRow3()
        
        // Test the Lock Modifiers
        pages.modifiersPage.testFirstRowLock()
        pages.modifiersPage.testSecondRowLock()
        
        // Check modifier buttons
        pages.modifiersPage.checkShiftBtn()
        pages.modifiersPage.checkCTRLBtn()
        pages.modifiersPage.checkCapsBtn()
        pages.modifiersPage.checkNumBtn()
        
        // Check the Clear All Modifiers function
        pages.modifiersPage.checkClearAllModifiersBtn()
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        
        print("Import Vocabulary Test Finished Successfully!")
    }
} 