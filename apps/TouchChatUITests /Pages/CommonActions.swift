//  CommonActions.swift
//  TouchChatUITests
//  Created by Alin Voinescu on 08.09.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import Foundation
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
        let skipBtn = app.buttons["Skip"]
        let skipBtnExists = skipBtn.waitForExistence(timeout: 10)
        XCTAssertTrue(skipBtnExists)
        skipBtn.tap()
        
        //to do a separate function
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
        
        if licenseAgreement.waitForExistence(timeout: 30) {
            app.switches.element(boundBy: 0).tap()
            continueBtn.tap()
        }
    }
    
    func skipAutomaticBackup(){
        let skipBtn = app.buttons["Skip"]
        let skipBtnExists = skipBtn.waitForExistence(timeout: 10)
        XCTAssertTrue(skipBtnExists)
        skipBtn.tap()
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
        app.buttons["Choose New Vocab"].tap()
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
        sleep(2)
        app.buttons["Settings"].tap()
    }
    
    // MARK: - Store Text Button
    func openStoreTextBtn() {
        app.navigationBars.buttons["Menu"].tap()
        app.popovers.scrollViews.otherElements.buttons["Store Text to Button"].tap()
        sleep(3)
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
        XCTAssertTrue(waitForTButton)
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
    
    func ensureAllowDeleteIsOn() {
        sleep(3)
        let allowDeleteSwitch = app.switches.element(boundBy: 7)
        if allowDeleteSwitch.value as? String == "0" {
                    allowDeleteSwitch.tap()
                }
                app.buttons["Done"].tap()
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
    
    func checkIfEnglishVocabIsExpanded(){
        let spellingSS = XCUIApplication().tables.staticTexts["Spelling SS"]
        let englishText = app.staticTexts["English"]
            
            // Wait up to 2 seconds for the "Spelling SS" button to appear
        let spellingSSExists = spellingSS.waitForExistence(timeout: 5)

            // If the button doesn't exist or isn't visible/interactable
            if !spellingSSExists || !spellingSS.isHittable {
                // Wait for "English" text and tap it if it's visible
                if englishText.waitForExistence(timeout: 5), englishText.isHittable {
                    englishText.tap()
                } else {
                    XCTFail("The 'English' label is not accessible for tapping.")
                }
            } else {
                // The "Spelling SS" button is visible — continue the test
                print("The 'Spelling SS' Vocabulary button is visible. Proceeding with the test...")
            }
    }
    }
