import XCTest

final class AboutTests: BaseTest {
    
    func testAboutScreen() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        
        // MARK: - When (Test Actions)
        // Navigate to About screen using proper navigation
        pages.vocabPage.menuButton.tap()
        pages.mainPage.aboutMButton.tap()
        sleep(10)
        
        // MARK: - Then (Verification)
        // Add verification logic here when the About screen structure is known
        // For now, we're just testing that navigation works without errors
        
        print("About Screen Test Finished Successfully!")
    }
} 