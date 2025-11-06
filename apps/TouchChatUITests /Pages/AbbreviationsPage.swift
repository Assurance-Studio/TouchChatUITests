//  AbbreviationsPage.swift
//  TouchChat
//  Created by Alin V on 28.08.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.


import XCTest

class AbbreviationsPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Abbreviations Access
    func reachAddAbbreviation() {
        app.navigationBars.buttons["Menu"].tap()
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        app.buttons["Edit Abbreviations"].tap()
        let abbreviationsNavigationBar = popoversQuery.navigationBars["Abbreviations"]
        let existsAbbreviationNavigationBar = abbreviationsNavigationBar.waitForExistence(timeout: 10)
        XCTAssertTrue(existsAbbreviationNavigationBar)
        abbreviationsNavigationBar.buttons["Add"].tap()
    }
    
    func addAbbreviation() {
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let abbreviationsNavigationBar = popoversQuery.navigationBars["Abbreviations"]
        let abbreviationElementsQuery = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Abbreviation")
        abbreviationElementsQuery.children(matching: .textField).element(boundBy: 0).tap()
        abbreviationElementsQuery.children(matching: .textField).element(boundBy: 0).typeText("test")
        
        let clearTextTextField = elementsQuery.textFields.containing(.button, identifier:"Clear text").element
        clearTextTextField.tap()
        abbreviationElementsQuery.children(matching: .textField).element(boundBy: 1).tap()
        abbreviationElementsQuery.children(matching: .textField).element(boundBy: 1).typeText("Test by e2e")
        abbreviationsNavigationBar.buttons["Save"].tap()
        abbreviationsNavigationBar.buttons["Done"].tap()
    }
    
    func checkAddAbbreviation() {
        app.buttons["t"].tap()
        app.staticTexts["e"].tap()
        app.buttons["s"].tap()
        app.buttons["t"].tap()
        app.buttons["."].tap()
        app.buttons["t"].tap()
        app.buttons["BackButton"].tap()
    }
    
    // MARK: - Edit Abbreviations
        func reachToEditAbbreviation() {
            app.navigationBars.buttons["Menu"].tap()
            let popoversQuery = app.popovers
            app.buttons["Edit Abbreviations"].tap()
            let editAbbreviationPage = popoversQuery.toolbars["Toolbar"].buttons["Edit"]
            let waitForTheEditAbbreviation = editAbbreviationPage.waitForExistence(timeout: 10)
            XCTAssertTrue(waitForTheEditAbbreviation)
            editAbbreviationPage.tap()
        }

        func removeTheAbbreviation() {
            app.buttons["Remove test., Test by e2e"].tap()
            app.buttons["Delete"].tap()

            let popoversQuery = app.popovers
            let scrollViewsQuery = popoversQuery.scrollViews
            let elementsQuery = scrollViewsQuery.otherElements
            let abbreviationsNavigationBar = popoversQuery.navigationBars["Abbreviations"]
            abbreviationsNavigationBar.buttons["Done"].tap()
        }

        // MARK: - Bulk Operations
        func clearAllAbbreviations() {
            app.popovers.toolbars["Toolbar"].buttons["Clear"].tap()
            XCTAssertTrue(app.staticTexts["Are you sure you want to erase all?"].exists, "The clear modal doesn't appear")
            app.alerts["Clear"].scrollViews.otherElements.buttons["Yes"].tap()
        }

        func restoreToDefaultsAbbreviation() {
            let popoversQuery = app.popovers
            popoversQuery.toolbars["Toolbar"].buttons["Restore Defaults"].tap()
            XCTAssertTrue(app.staticTexts["Are you sure you want to restore all default values?"].exists, "The restore modal doesn't appear")
            app.alerts["Restore Defaults"].scrollViews.otherElements.buttons["Yes"].tap()
            popoversQuery.navigationBars["Abbreviations"].buttons["Done"].tap()
        }
    }
