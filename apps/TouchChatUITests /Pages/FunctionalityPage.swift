import XCTest

class FunctionalityPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - About Functionality
    func reachAboutScreen() {
        // Navigate to About screen using the proper navigation
        // This requires access to vocabPage and mainPage which are available through PageManager
        // The actual implementation will be handled in the test using pages.vocabPage and pages.mainPage
    }
    
    // MARK: - iShare Functionality
    func reachIShareService() {
        // Navigate to iShare service using the proper navigation
        // This requires access to vocabPage and mainPage which are available through PageManager
        // The actual implementation will be handled in the test using pages.vocabPage and pages.mainPage
    }
    
    func registerForIShare(firstName: String, email: String, password: String) {
        // Navigate to iShare registration
        // reachIShareService() will be called from the test using proper navigation
        
        // Tap register button
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Register for iShare"].tap()
        
        // Fill in registration form
        let firstNameField = app.textFields["First Last"]
        firstNameField.tap()
        firstNameField.typeText(firstName)
        
        let emailField = app.textFields["name@domain.com"]
        emailField.tap()
        emailField.typeText(email)
        
        // Handle password fields
        let passwordFields = app.secureTextFields
        if passwordFields.count >= 2 {
            passwordFields.element(boundBy: 0).press(forDuration: 1.0)
            app.menuItems["Paste"].tap()
            passwordFields.element(boundBy: 1).press(forDuration: 1.0)
            passwordFields.element(boundBy: 1).typeText(password)
        }
        
        // Tap register button
        app.buttons["Register"].press(forDuration: 1)
    }
    
    func verifyIShareRegistration() -> Bool {
        let firstRegisterMessage = app.staticTexts["Thank you for registering for iShare. You have been granted a free 365 day trial of the iShare services."]
        let secondRegisterMessage = app.staticTexts["Successful registration"]
        
        let firstExists = firstRegisterMessage.waitForExistence(timeout: 5)
        let secondExists = secondRegisterMessage.waitForExistence(timeout: 5)
        
        return firstExists || secondExists
    }
    
    func signOutFromIShare() {
        app.buttons["Okay"].tap()
        sleep(2)
        app.buttons["Sign Out"].press(forDuration: 1)
    }
    
    // MARK: - Import Vocabulary Functionality
    func importAVocab() {
        // Navigate to import vocabulary using the proper navigation
        // This requires access to vocabPage which is available through PageManager
        // The actual implementation will be handled in the test using pages.vocabPage
    }
    
    func importFromDropBox() {
        app.buttons["Import/Export Vocab"].tap()
        
        let dropBoxBtn = app.buttons["DropBox"]
        XCTAssertTrue(dropBoxBtn.waitForExistence(timeout: 5), "DropBox button not found")
        dropBoxBtn.tap()
        
        let importFromDropBox = app.buttons["Import from DropBox"]
        XCTAssertTrue(importFromDropBox.waitForExistence(timeout: 5), "Import from DropBox button not found")
        importFromDropBox.tap()
    }
    
    func loginToDropBox(email: String, password: String) {
        sleep(7) // Wait for DropBox to load
        
        // Handle cookies
        let declineCookies = app.buttons["Decline"]
        if declineCookies.exists {
            declineCookies.tap()
        }
        
        let emailField = app.textFields["Email"]
        if emailField.exists {
            XCTAssertTrue(emailField.waitForExistence(timeout: 10), "Email field not found")
            emailField.tap()
            emailField.typeText(email)
            app.buttons["Continue"].tap()
            
            let passwordField = app.secureTextFields.element(boundBy: 0)
            passwordField.tap()
            passwordField.typeText(password)
            app.buttons["Log in"].tap()
            
            sleep(3)
            
            // Handle save password dialog
            let savePass = app.buttons["Save Password"]
            if savePass.waitForExistence(timeout: 10) {
                savePass.tap()
                app.buttons["Set up later"].tap()
            }
            
            // Handle allow permissions
            let allowBtn = app.buttons["Allow"]
            if allowBtn.waitForExistence(timeout: 10) {
                allowBtn.press(forDuration: 2)
            }
        }
    }
    
    func selectAndImportFile(fileName: String, description: String) {
        app.staticTexts[fileName].tap()
        
        let importFileName = app.staticTexts["Import File Name"]
        XCTAssertTrue(importFileName.waitForExistence(timeout: 10), "Import File Name not found")
        
        let descriptionField = app.textFields.element(boundBy: 1)
        XCTAssertTrue(descriptionField.waitForExistence(timeout: 10), "Description field not found")
        descriptionField.tap()
        descriptionField.typeText(description)
        app.buttons["Save"].tap()
    }
    
    // MARK: - Utility Methods
    func generateRandomString(length: Int) -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMN0123456789"
        return String((0..<length).map { _ in characters.randomElement()! })
    }
} 