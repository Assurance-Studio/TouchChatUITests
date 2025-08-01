import XCTest

final class IShareTests: BaseTest {
    
    // MARK: - Test Configuration
    private let testPassword = "E2ePassword"
    
    func testIShareRegistration() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        // Set up pasteboard with test password
        UIPasteboard.general.string = testPassword
        
        // Generate random text for unique test data
        let randomText = pages.functionalityPage.generateRandomString(length: 5)
        let testFirstName = "Test by e2e" + randomText
        let testEmail = "TestBye2e" + randomText + "@gmail.com"
        
        // MARK: - When (Test Actions)
        // Navigate to iShare service
        pages.vocabPage.menuButton.tap()
        pages.mainPage.iShareServiceMButton.tap()
        sleep(5)
        
        // Register for iShare
        pages.functionalityPage.registerForIShare(
            firstName: testFirstName,
            email: testEmail,
            password: testPassword
        )
        
        // MARK: - Then (Verification)
        // Verify registration was successful
        let registrationSuccessful = pages.functionalityPage.verifyIShareRegistration()
        XCTAssertTrue(registrationSuccessful, "iShare registration failed")
        
        // MARK: - Cleanup
        // Sign out from iShare
        pages.functionalityPage.signOutFromIShare()
        
        print("iShare Registration Test Finished Successfully!")
    }
}
