//
//  PronunciationsPage.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 04.09.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

class PronunciationsPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Pronunciations Management
    func reachEditPronunciations() {
        app.navigationBars.buttons["Menu"].tap()
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        app.buttons["Edit Pronunciations"].tap()
        let pronunciationsNavigationBar = popoversQuery.navigationBars["Pronunciations"]
        let existsPronunciationsNavigationBar = pronunciationsNavigationBar.waitForExistence(timeout: 5)
        pronunciationsNavigationBar.buttons["Add"].tap()
    }
    
    func addPronunciations() {
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let pronunciationsNavigationBar = popoversQuery.navigationBars["Pronunciations"]
        app.textFields.element(boundBy: 2).tap()
        app.textFields.element(boundBy: 2).typeText("test")
        app.textFields.element(boundBy: 3).tap()
        app.textFields.element(boundBy: 3).typeText("Test by e2e")
        pronunciationsNavigationBar.buttons["Save"].tap()
    }
    
    func scrollForSearchPronunciations() {
        let scrollViewToolbar = app.staticTexts["⛄"]
        XCTAssertTrue(scrollViewToolbar.exists, "Toolbar doesn't exist.")
        
        let elementPosition = scrollViewToolbar.frame.origin
        let elementSize = scrollViewToolbar.frame.size
        let centerX = elementPosition.x + elementSize.width / 2
        let centerY = elementPosition.y + elementSize.height / 2
        
        let startCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: centerX / UIScreen.main.bounds.width, dy: centerY / UIScreen.main.bounds.height))
        let endCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: centerX / UIScreen.main.bounds.width, dy: (centerY + 100) / UIScreen.main.bounds.height))
        
        startCoordinate.press(forDuration: 0.1, thenDragTo: endCoordinate)
    }
    
    func searchPronunciations() {
            app.searchFields["Search"].tap()
            app.searchFields["Search"].typeText("test")
        }

        func deletePronunciations() {
            let popoversQuery = XCUIApplication().popovers
            let toolbar = popoversQuery.toolbars["Toolbar"]
            toolbar.buttons["Edit"].tap()

            let tablesQuery = popoversQuery.tables
            tablesQuery.buttons["Remove test, Test by e2e"].tap()
            tablesQuery.buttons["Delete"].tap()
            toolbar.buttons["Done"].tap()
            popoversQuery.navigationBars["Pronunciations"].buttons["Cancel"].tap()
        }

        func clearAllPronunciations() {
            app.buttons["Clear"].tap()
            XCTAssertTrue(app.staticTexts["Are you sure you want to erase all?"].exists, "The clear modal doesn't appear")
            app.buttons["Yes"].tap()
        }

        func restoreToDefaultsPronunciations() {
            app.buttons["Restore Defaults"].tap()
            XCTAssertTrue(app.staticTexts["Are you sure you want to restore all default values?"].exists, "The Restore Defaults modal doesn't appear")
            app.buttons["Yes"].tap()
            app.buttons["Done"].tap()
        }
    }
