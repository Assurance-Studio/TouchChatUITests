//
//  GesturesPage.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 03.09.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

class GesturesPage {
    let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    // MARK: - Gesture Management
    func addNewGesture() {
        app.navigationBars.buttons["Menu"].tap()
        app.buttons["Edit Gestures"].tap()
        let addGestureButton = app.buttons["Add"]
        let addGestureButtonExists = addGestureButton.waitForExistence(timeout: 5)
        XCTAssertTrue(addGestureButtonExists, "The Add button is visible")
        addGestureButton.tap()
        
        let firstTextField = app.textFields.element(boundBy: 0)
        firstTextField.tap()
        firstTextField.typeText("Gesture by e2e")
        
        let popoversQuery = app.popovers
        popoversQuery.scrollViews.otherElements.buttons["Add"].tap()
        
        let tablesQuery = popoversQuery.tables
        tablesQuery.staticTexts["Clear Display"].swipeUp()
                sleep(2)
                tablesQuery.staticTexts["Help Signal"].swipeUp()
                sleep(2)
                tablesQuery.staticTexts["Navigate To Home"].swipeUp()
                sleep(2)
                tablesQuery.staticTexts["Speak"].swipeUp()
                sleep(3)
                let speechMessageOption = tablesQuery.staticTexts["Speech Message"]
                let speechMessageOptionExists = speechMessageOption.waitForExistence(timeout: 5)
                XCTAssertTrue(speechMessageOptionExists, "The Speech Message option is not visible.")
                speechMessageOption.tap()

                let saveBtn = app.buttons["Save"]
                let saveBtnExists = saveBtn.waitForExistence(timeout: 7)
                XCTAssertTrue(saveBtnExists)
                saveBtn.tap()
                sleep(3)
                app.popovers.navigationBars["Select Gesture"].buttons["Done"].tap()
                sleep(3)
                app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
            }
    
    func verifyGestureExists() {
            let scrollViewToolbar = app.buttons["t"]
            XCTAssertTrue(scrollViewToolbar.exists, "Toolbar doesn't exist.")

            let elementPosition = scrollViewToolbar.frame.origin
            let elementSize = scrollViewToolbar.frame.size
            let centerX = elementPosition.x + elementSize.width / 2
            let centerY = elementPosition.y + elementSize.height / 2

            let startCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: centerX / UIScreen.main.bounds.width, dy: centerY / UIScreen.main.bounds.height))
            let endCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: centerX / UIScreen.main.bounds.width, dy: (centerY - 100) / UIScreen.main.bounds.height))

            startCoordinate.press(forDuration: 0.1, thenDragTo: endCoordinate)

            let sdbElement = app.textFields["Gesture by e2e "]
            XCTAssertTrue(sdbElement.exists, "Searched text not found")
        }
    } 
        
