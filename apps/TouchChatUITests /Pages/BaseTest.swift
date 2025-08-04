import XCTest

class BaseTest: XCTestCase {
    var app: XCUIApplication!
    var pages: PageManager!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        
        pages = PageManager(app: app)
        
        // Handle common modals
        handleInitialModals()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }
    
    // MARK: - Common Setup Methods
    private func handleInitialModals() {
        pages.common.checkLicenseModal()
        pages.common.checkStartModal()
        pages.common.clickWelcomeX()
    }
    
    // MARK: - Utility Methods
    func waitForElement(_ element: XCUIElement, timeout: TimeInterval = 10, file: StaticString = #file, line: UInt = #line) {
        let exists = element.waitForExistence(timeout: timeout)
        XCTAssertTrue(exists, "Element \(element) not found within \(timeout) seconds", file: file, line: line)
    }
    
    func tapElement(_ element: XCUIElement, timeout: TimeInterval = 10, file: StaticString = #file, line: UInt = #line) {
        waitForElement(element, timeout: timeout, file: file, line: line)
        element.tap()
    }
    
    func typeText(_ element: XCUIElement, text: String, timeout: TimeInterval = 10, file: StaticString = #file, line: UInt = #line) {
        waitForElement(element, timeout: timeout, file: file, line: line)
        element.tap()
        element.typeText(text)
    }
    
    func createTestVocabulary(name: String, description: String) {
        pages.mainPage.copyVocabPC(vocabName: name, vocabDescription: description)
    }
    
    func createSpellingTestVocabulary(name: String, description: String) {
        pages.mainPage.copySpellingVocab(vocabName: name, vocabDescription: description)
    }
    
    func cleanupTestVocabulary(name: String) {
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: name)
    }
} 
