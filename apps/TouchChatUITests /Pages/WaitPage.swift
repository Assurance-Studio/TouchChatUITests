//
//  WaitPage.swift
//  TouchChatUITests
//
//  Created by Marius N on 01.08.2025
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

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
    // sleep() expects an UInt32.
    func waitShort() {
        usleep(UInt32(WaitDuration.short * 1_000_000))
    }
    
    func waitMedium() {
        usleep(UInt32(WaitDuration.medium * 1_000_000))
    }
    
    func waitLong() {
        usleep(UInt32(WaitDuration.long * 1_000_000))
    }
    
    func waitExtraLong() {
        usleep(UInt32(WaitDuration.extraLong * 1_000_000))
    }
    
    func waitVeryLong() {
        usleep(UInt32(WaitDuration.veryLong * 1_000_000))
    }
    
    // MARK: - Custom Duration Wait
    func wait(duration: TimeInterval) {
        usleep(UInt32(duration * 1_000_000))
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

    func waitUntil(
        _ condition: @escaping () -> Bool,
        timeout: TimeInterval = WaitDuration.medium,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let startTime = Date()
        while !condition() {
            if Date().timeIntervalSince(startTime) >= timeout {
                XCTFail("Condition not met within \(timeout) seconds", file: file, line: line)
                return
            }
            usleep(500_000) // 0.5 seconds
        }
    }

    func waitUntilElementExists(
        _ element: XCUIElement,
        timeout: TimeInterval = WaitDuration.medium
    ) -> Bool {
        let startTime = Date()
        while !element.exists {
            if Date().timeIntervalSince(startTime) >= timeout {
                return false
            }
            usleep(500_000) // 0.5 seconds
        }
        return true
    }
    
    // MARK: - Network/API Wait Methods

    /// Wait for a network request to complete (placeholder)
    func waitForNetworkRequest(timeout: TimeInterval = WaitDuration.long) {
        // In real tests, replace this with logic that waits for a network indicator or spinner
        usleep(UInt32(timeout * 1_000_000))
    }

    // MARK: - Animation Wait Methods

    /// Wait for UI animation to complete (placeholder)
    func waitForAnimationToComplete(timeout: TimeInterval = WaitDuration.medium) {
        // In real tests, wait for an animation element to disappear or become hittable
        usleep(UInt32(timeout * 1_000_000))
    }

    // MARK: - Page Load Wait Methods

    /// Wait for a page to fully load (placeholder)
    func waitForPageToLoad(timeout: TimeInterval = WaitDuration.long) {
        // Replace with element existence/assertion once page structure is known
        usleep(UInt32(timeout * 1_000_000))
    }

    // MARK: - Utility Wait Methods

    /// Wait for the app to become ready or idle (placeholder)
    func waitForAppToBeReady(timeout: TimeInterval = WaitDuration.medium) {
        // This could wait for specific elements like "Ready" label or disable state of a loading overlay
        usleep(UInt32(timeout * 1_000_000))
    }

    /// Wait for background processing to complete (placeholder)
    func waitForBackgroundProcess(timeout: TimeInterval = WaitDuration.long) {
        // This could monitor CPU usage or progress indicators in production code
        usleep(UInt32(timeout * 1_000_000))
    }
} 
