import XCTest

class EditPageActions {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Edit Page Access
    func editPage() {
        sleep(5)
        app.navigationBars.buttons["Menu"].tap()
        app.buttons["Edit Page"].tap()
        sleep(2)
    }
    
    // MARK: - Button Editing
    func editThisButton() {
        sleep(2)
        app.buttons.element(boundBy: 12).tap()
        app.buttons["Edit This Button"].tap()
        
        let buttonLabel = app.textFields.element(boundBy: 0)
        let existsButtonLabel = buttonLabel.waitForExistence(timeout: 5)
        XCTAssertTrue(existsButtonLabel, "The button label is not visible")
        
        app.textFields.element(boundBy: 0).tap()
        app.textFields.element(boundBy: 0).typeText("Edit Button by e2e")
        
        app.textFields.element(boundBy: 2).tap()
        app.textFields.element(boundBy: 2).typeText("Pronunciation by e2e")
    }
    
    func selectImageButton() {
        let popoversQuery = XCUIApplication().popovers
        let selectImageBtn = popoversQuery.scrollViews.otherElements.buttons["Select Image"]
        let selectImageBtnExists = selectImageBtn.waitForExistence(timeout: 10)
        XCTAssertTrue(selectImageBtnExists)
        selectImageBtn.tap()
        sleep(4)
        
        let tablesQuery = popoversQuery.tables
        app.staticTexts["PRC Symbols"].tap()
        
        tablesQuery.staticTexts["E"].tap()
        tablesQuery.cells.containing(.staticText, identifier:"Edge").staticTexts["Source: PRC Symbols"].tap()
    }
    
    func checkSwitchesEditButton() {
        let labelOnTop = app.switches.element(boundBy: 0)
        XCTAssertTrue(labelOnTop.waitForExistence(timeout: 5), "The toggle does not exist")
        
        let initialState = labelOnTop.value as! String
        print("Initial State: \(initialState)")
        
        if initialState == "1" {
            labelOnTop.tap()
        }
        
        let boldText = app.switches.element(boundBy: 1)
        XCTAssertTrue(boldText.waitForExistence(timeout: 5), "The toggle does not exist")
        
        let italicsText = app.switches.element(boundBy: 2)
        XCTAssertTrue(italicsText.waitForExistence(timeout: 5), "The toggle does not exist")
        
        let transparentOption = app.switches.element(boundBy: 3)
        XCTAssertTrue(transparentOption.waitForExistence(timeout: 5), "The toggle does not exist")
        
        let visibleOption = app.switches.element(boundBy: 4)
        XCTAssertTrue(visibleOption.waitForExistence(timeout: 5), "The toggle does not exist")
    }
    
    // MARK: - Button Actions
    func addActionButton(buttonName: String) {
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.scrollViews.otherElements.buttons["Add"].tap()
        popoversQuery.tables.staticTexts["Add Message to Display"].tap()
        popoversQuery.navigationBars["Edit Button"].buttons["Save"].tap()
        app.buttons["Done"].tap()
        
        let editButton = app.buttons[buttonName]
        XCTAssertTrue(editButton.exists, "The edit button is not visible")
        
        editButton.tap()
    }
    
    func changeButtonSize(buttonName: String) {
        let app = XCUIApplication()
        app.navigationBars.buttons["Menu"].tap()
        sleep(2)
        
        let popoversQuery = app.popovers
        let elementsQuery = popoversQuery.scrollViews.otherElements
        elementsQuery.buttons["Edit Page"].tap()
        sleep(2)
        app.buttons[buttonName].tap()
        elementsQuery.buttons["Change Button Size"].tap()
        sleep(2)
        app.staticTexts["1 Column"].tap()
        app.staticTexts["2 Columns"].tap()
        
        popoversQuery.navigationBars["Edit Size"].buttons["Save"].tap()
    }
    
    func removeTheButton(buttonName: String) {
        app.buttons[buttonName].tap()
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Remove Button From Page"].tap()
        XCTAssertTrue(app.staticTexts["Confirm Button Deletion"].exists, "The delete modal doesn't appear")
        app.buttons["Okay"].tap()
        app.buttons["Done"].tap()
    }
    
    // MARK: - Button Creation
    func createANewButton() {
        app.buttons.element(boundBy: 12).tap()
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Create New Button"].tap()
        
        let buttonLabel = app.textFields.element(boundBy: 0)
        let existsButtonLabel = buttonLabel.waitForExistence(timeout: 5)
        XCTAssertTrue(existsButtonLabel, "The button label is not visible")
        
        app.textFields.element(boundBy: 0).tap()
        app.textFields.element(boundBy: 0).typeText("Create Button by e2e")
        
        app.textFields.element(boundBy: 2).tap()
        app.textFields.element(boundBy: 2).typeText("Pronunciation by e2e")
    }
    
    func createButtonForActions(button: Int, nameButton: String) {
        app.buttons.element(boundBy: button).tap()
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Create New Button"].tap()
        
        let buttonLabel = app.textFields.element(boundBy: 0)
        let existsButtonLabel = buttonLabel.waitForExistence(timeout: 5)
        XCTAssertTrue(existsButtonLabel, "The button label is not visible")
        
        app.textFields.element(boundBy: 0).tap()
        app.textFields.element(boundBy: 0).typeText(nameButton)
        
        app.textFields.element(boundBy: 2).tap()
        app.textFields.element(boundBy: 2).typeText("Pronunciation by e2e")
    }
    
    // MARK: - Copy/Paste Operations
    func copyAButton(buttonName: String) {
        app.buttons[buttonName].tap()
        
        let app = XCUIApplication()
        app.popovers.scrollViews.otherElements.buttons["Copy Button"].tap()
    }
    
    func pasteTheButton() {
        app.buttons.element(boundBy: 14).tap()
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Paste Button"].tap()
        app.navigationBars["Main"].buttons["Done"].tap()
        app.buttons.element(boundBy: 14).tap()
        app.buttons["drink"].tap()
    }
    
    func useTheSameButton() {
        app.buttons.element(boundBy: 13).tap()
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Use Same Button"].tap()
        app.buttons.element(boundBy: 12).tap()
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Use Same Button"].tap()
        
        app.navigationBars["Main"].buttons["Done"].tap()
        app.buttons.element(boundBy: 13).tap()
        app.buttons["snack"].tap()
    }
} 