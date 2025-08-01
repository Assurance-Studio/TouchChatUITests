import XCTest

final class editGesturesTestsRefactored: BaseTest {
    
    // MARK: - Test Configuration
    private let testVocabName = "copied vocabulary gestures"
    private let testVocabDescription = "vocabulary description e2e"
    
    func testEditGesturesPage() throws {
        // MARK: - Given (Test Setup)
        createSpellingTestVocabulary(name: testVocabName, description: testVocabDescription)
        
        pages.mainPage.openVocab(
            , 
            vocab: testVocabName
        )
        
        // MARK: - When (Test Actions)
        // Enable delete vocab option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // Add a new gesture
        pages.editPage.editPage()
        pages.gesturesPage.addNewGesture()
        pages.gesturesPage.verifyGestureExists()
        
        // MARK: - Cleanup
        cleanupTestVocabulary(name: testVocabName)
        
        print("Edit Gestures Test Finished with success!")
    }
} 