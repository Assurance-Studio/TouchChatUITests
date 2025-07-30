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
        elementsQuery.buttons["Edit Pronunciations"].tap()
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