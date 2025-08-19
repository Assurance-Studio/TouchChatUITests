import XCTest

class CommonActions {
    let app: XCUIApplication
    
    // MARK: - Vocabulary Elements
    let spellingSS: XCUIElement
    
    init(app: XCUIApplication) {
        self.app = app
        spellingSS = app.tables.staticTexts["Spelling SS"]
    }
    
    // MARK: - Modal Handling
    func clickWelcomeX() {
        sleep(5)
        let welcomeModal = app.staticTexts["Welcome"]
        let centerScreenCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: 0.3, dy: 0.3))
        
        if welcomeModal.exists {
            centerScreenCoordinate.tap()
            sleep(1)
        }
    }
    
    func checkStartModal() {
        let startModal = app.staticTexts["Select your language and voice"]
        if startModal.exists {
            app.buttons["Continue"].tap()
            sleep(1)
        }
    }
    
    func checkLicenseModal() {
        let licenseAgreement = app.staticTexts["License Agreement"]
        let continueBtn = app.buttons["Continue"]
        
        if licenseAgreement.exists {
            app.switches.element(boundBy: 0).tap()
            continueBtn.tap()
        }
    }
    
    func openAVocab() {
        let openAVocabModal = app.staticTexts["What would you like to do with this vocabulary?"]
        XCTAssertTrue(openAVocabModal.exists, "The open vocab modal is not visible.")
        app.buttons["Open"].tap()
    }
    
    // MARK: - Navigation
    func backToVocab() {
        let vocabButton = app.navigationBars.buttons["Vocab"]
        let vocabButtonExists = vocabButton.waitForExistence(timeout: 5)
        XCTAssertTrue(vocabButtonExists)
        vocabButton.tap()
        app.popovers.scrollViews.otherElements.buttons["Choose New Vocab"].tap()
        let editButtonPage = app.buttons["Edit"]
        let editButtonExists = editButtonPage.waitForExistence(timeout: 8)
        XCTAssertTrue(editButtonExists)
    }
    
    func pressBackButton(timeout: TimeInterval = 15) {
        let vocabButton = app.buttons["Vocab"]
        let startTime = Date()

        while !vocabButton.exists {
            let backButton = app.navigationBars.buttons["Back"]
            if backButton.waitForExistence(timeout: 2) {
                backButton.tap()
            } else {
                XCTFail("Back button not found during back-navigation")
                return
            }

            if Date().timeIntervalSince(startTime) > timeout {
                XCTFail("Timed out waiting for 'Vocab' button to appear after back navigation")
                return
            }

            usleep(500_000) // brief delay to allow screen to update
        }

        XCTAssertTrue(vocabButton.exists, "'Vocab' button did not appear after back-navigation")
    }
    
    func openTheSettingsTab() {
        app.navigationBars.buttons["Menu"].tap()
        let popoversQuery = app.popovers
        popoversQuery.scrollViews.otherElements.buttons["Settings"].tap()
    }
    
    // MARK: - Store Text Button
    func openStoreTextBtn() {
        app.navigationBars.buttons["Menu"].tap()
        app.popovers.scrollViews.otherElements.buttons["Store Text to Button"].tap()
        XCTAssertTrue(app.staticTexts["Select the button where you want to store your composed message"].exists, "The Store Text modal doesn't appear")
        app.alerts["Store Text to Button?"].scrollViews.otherElements.buttons["Continue"].tap()
    }
    
    func checkIfTheStoreButtonWorks() {
        app.buttons["SPACE"].tap()
        XCTAssertTrue(app.buttons["Testby"].exists, "The StoreTextButton is not visible")
        app.buttons["Testby"].tap()
    }
    
    // MARK: - Utility Methods
    func clearAppCache() {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
    }
    
    func checkSdbText(sdbText: String) {
        let sdbElement = app.textFields[sdbText]
        XCTAssertTrue(sdbElement.exists, "Searched text not found")
    }
    
    func writeTestBy() {
        let tbutton = app.buttons["t"]
        let waitForTButton = tbutton.waitForExistence(timeout: 5)
        app.buttons["t"].tap()
        app.buttons["e"].tap()
        app.buttons["s"].tap()
        app.buttons["t"].tap()
        app.buttons["b"].tap()
        app.buttons["y"].tap()
    }
    
    // MARK: - Helper Methods
    func scrollDownUntilElementIsVisible(element: XCUIElement, maxScrolls: Int = 5, timeout: TimeInterval = 10) {
        let startTime = Date()
        var scrollAttempts = 0
        
        while !element.exists || !element.isHittable {
            if scrollAttempts >= maxScrolls || Date().timeIntervalSince(startTime) >= timeout {
                break
            }
            app.swipeUp()
            scrollAttempts += 1
            sleep(1)
        }
    }
    
    func scrollUpUntilElementIsVisible(element: XCUIElement, maxScrolls: Int = 5, timeout: TimeInterval = 10) {
        let startTime = Date()
        var scrollAttempts = 0
        
        while !element.exists || !element.isHittable {
            if scrollAttempts >= maxScrolls || Date().timeIntervalSince(startTime) >= timeout {
                break
            }
            app.swipeDown()
            scrollAttempts += 1
            sleep(1)
        }
    }
    
    func assertElementExists(element: XCUIElement, timeout: TimeInterval = 5) -> Bool {
        let existsPredicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: element)
        
        let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
        return result == .completed
    }
    
    func randomString(length: Int) -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMN0123456789"
        return String((0..<length).map{ _ in characters.randomElement()! })
    }
} 
