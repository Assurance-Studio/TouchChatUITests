import XCTest

class WaitPage {
    let app: XCUIApplication
    
    // MARK: - Wait Duration Constants
    struct WaitDuration {
        static let short: TimeInterval = 2
        static let medium: TimeInterval = 5
        static let long: TimeInterval = 10
        static let extraLong: TimeInterval = 15
        static let veryLong: TimeInterval = 30
    }
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Basic Wait Methods
    func waitShort() {
        sleep(WaitDuration.short)
    }
    
    func waitMedium() {
        sleep(WaitDuration.medium)
    }
    
    func waitLong() {
        sleep(WaitDuration.long)
    }
    
    func waitExtraLong() {
        sleep(WaitDuration.extraLong)
    }
    
    func waitVeryLong() {
        sleep(WaitDuration.veryLong)
    }
    
    // MARK: - Custom Duration Wait
    func wait(duration: TimeInterval) {
        sleep(duration)
    }
    
    // MARK: - Element Wait Methods
    func waitForElement(_ element: XCUIElement, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let exists = element.waitForExistence(timeout: timeout)
        XCTAssertTrue(exists, "Element \(element) not found within \(timeout) seconds", file: file, line: line)
    }
    
    func waitForElementToExist(_ element: XCUIElement, timeout: TimeInterval = WaitDuration.medium) -> Bool {
        return element.waitForExistence(timeout: timeout)
    }
    
    func waitForElementToDisappear(_ element: XCUIElement, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let exists = element.waitForExistence(timeout: timeout)
        XCTAssertFalse(exists, "Element \(element) still exists after \(timeout) seconds", file: file, line: line)
    }
    
    func waitForElementToBeHittable(_ element: XCUIElement, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let predicate = NSPredicate(format: "isHittable == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        XCTAssertEqual(result, .completed, "Element \(element) is not hittable within \(timeout) seconds", file: file, line: line)
    }
    
    func waitForElementToBeEnabled(_ element: XCUIElement, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let predicate = NSPredicate(format: "isEnabled == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        XCTAssertEqual(result, .completed, "Element \(element) is not enabled within \(timeout) seconds", file: file, line: line)
    }
    
    // MARK: - Text Wait Methods
    func waitForText(_ text: String, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let textElement = app.staticTexts[text]
        waitForElement(textElement, timeout: timeout, file: file, line: line)
    }
    
    func waitForTextToExist(_ text: String, timeout: TimeInterval = WaitDuration.medium) -> Bool {
        let textElement = app.staticTexts[text]
        return textElement.waitForExistence(timeout: timeout)
    }
    
    func waitForTextToDisappear(_ text: String, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let textElement = app.staticTexts[text]
        waitForElementToDisappear(textElement, timeout: timeout, file: file, line: line)
    }
    
    // MARK: - Button Wait Methods
    func waitForButton(_ buttonText: String, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let button = app.buttons[buttonText]
        waitForElement(button, timeout: timeout, file: file, line: line)
    }
    
    func waitForButtonToExist(_ buttonText: String, timeout: TimeInterval = WaitDuration.medium) -> Bool {
        let button = app.buttons[buttonText]
        return button.waitForExistence(timeout: timeout)
    }
    
    func waitForButtonToBeHittable(_ buttonText: String, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let button = app.buttons[buttonText]
        waitForElementToBeHittable(button, timeout: timeout, file: file, line: line)
    }
    
    // MARK: - TextField Wait Methods
    func waitForTextField(_ fieldIdentifier: String, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let textField = app.textFields[fieldIdentifier]
        waitForElement(textField, timeout: timeout, file: file, line: line)
    }
    
    func waitForSecureTextField(_ fieldIdentifier: String, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let secureTextField = app.secureTextFields[fieldIdentifier]
        waitForElement(secureTextField, timeout: timeout, file: file, line: line)
    }
    
    // MARK: - Navigation Wait Methods
    func waitForNavigationBar(_ title: String, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let navigationBar = app.navigationBars[title]
        waitForElement(navigationBar, timeout: timeout, file: file, line: line)
    }
    
    func waitForTabBar(_ tabName: String, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let tabBar = app.tabBars.buttons[tabName]
        waitForElement(tabBar, timeout: timeout, file: file, line: line)
    }
    
    // MARK: - Alert Wait Methods
    func waitForAlert(_ alertTitle: String, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let alert = app.alerts[alertTitle]
        waitForElement(alert, timeout: timeout, file: file, line: line)
    }
    
    func waitForAlertToExist(_ alertTitle: String, timeout: TimeInterval = WaitDuration.medium) -> Bool {
        let alert = app.alerts[alertTitle]
        return alert.waitForExistence(timeout: timeout)
    }
    
    // MARK: - Sheet Wait Methods
    func waitForSheet(_ sheetTitle: String, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let sheet = app.sheets[sheetTitle]
        waitForElement(sheet, timeout: timeout, file: file, line: line)
    }
    
    // MARK: - Popover Wait Methods
    func waitForPopover(_ popoverTitle: String, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let popover = app.popovers[popoverTitle]
        waitForElement(popover, timeout: timeout, file: file, line: line)
    }
    
    // MARK: - Activity Indicator Wait Methods
    func waitForActivityIndicatorToDisappear(timeout: TimeInterval = WaitDuration.long, file: StaticString = #file, line: UInt = #line) {
        let activityIndicator = app.activityIndicators.firstMatch
        if activityIndicator.exists {
            waitForElementToDisappear(activityIndicator, timeout: timeout, file: file, line: line)
        }
    }
    
    // MARK: - Keyboard Wait Methods
    func waitForKeyboardToAppear(timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let keyboard = app.keyboards.firstMatch
        waitForElement(keyboard, timeout: timeout, file: file, line: line)
    }
    
    func waitForKeyboardToDisappear(timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let keyboard = app.keyboards.firstMatch
        if keyboard.exists {
            waitForElementToDisappear(keyboard, timeout: timeout, file: file, line: line)
        }
    }
    
    // MARK: - Conditional Wait Methods
    func waitUntil(_ condition: @escaping () -> Bool, timeout: TimeInterval = WaitDuration.medium, file: StaticString = #file, line: UInt = #line) {
        let startTime = Date()
        while !condition() {
            if Date().timeIntervalSince(startTime) >= timeout {
                XCTFail("Condition not met within \(timeout) seconds", file: file, line: line)
                return
            }
            sleep(0.5)
        }
    }
    
    func waitUntilElementExists(_ element: XCUIElement, timeout: TimeInterval = WaitDuration.medium) -> Bool {
        let startTime = Date()
        while !element.exists {
            if Date().timeIntervalSince(startTime) >= timeout {
                return false
            }
            sleep(0.5)
        }
        return true
    }
    
    // MARK: - Network/API Wait Methods
    func waitForNetworkRequest(timeout: TimeInterval = WaitDuration.long) {
        // This is a placeholder for network request waits
        // In a real implementation, you might wait for specific network indicators
        sleep(timeout)
    }
    
    // MARK: - Animation Wait Methods
    func waitForAnimationToComplete(timeout: TimeInterval = WaitDuration.medium) {
        // This is a placeholder for animation completion waits
        // In a real implementation, you might wait for specific animation indicators
        sleep(timeout)
    }
    
    // MARK: - Page Load Wait Methods
    func waitForPageToLoad(timeout: TimeInterval = WaitDuration.long) {
        // This is a placeholder for page load waits
        // In a real implementation, you might wait for specific page load indicators
        sleep(timeout)
    }
    
    // MARK: - Utility Wait Methods
    func waitForAppToBeReady(timeout: TimeInterval = WaitDuration.medium) {
        // Wait for the app to be in a ready state
        // This could be customized based on your app's specific indicators
        sleep(timeout)
    }
    
    func waitForBackgroundProcess(timeout: TimeInterval = WaitDuration.long) {
        // Wait for background processes to complete
        sleep(timeout)
    }
} 