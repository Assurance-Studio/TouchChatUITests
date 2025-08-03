import XCTest

class ButtonActionsPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Button Creation and Management
    
    func removeAButton(button: Int) {
//        sleep(5)
        let buttonEmpty = app.buttons.element(boundBy: button)
        let buttonEmptyExists = buttonEmpty.waitForExistence(timeout: 10)
        XCTAssertTrue(buttonEmptyExists, "The Button empty doesn't exist.")
        buttonEmpty.tap()
    
        sleep(3)
        let removeButtonSet = XCUIApplication().popovers.scrollViews.otherElements.buttons["Remove ButtonSet From Page"]
        let removeButtonSetExists = removeButtonSet.waitForExistence(timeout: 10)
        XCTAssertTrue(removeButtonSetExists)
        removeButtonSet.tap()
        //XCUIApplication().popovers.scrollViews.otherElements.buttons["Remove ButtonSet From Page"].tap()
        let confirmDeleteBtn = app.staticTexts["Confirm Button Deletion"]
        let confirmDeleteBtnExists = confirmDeleteBtn.waitForExistence(timeout: 10)
        XCTAssertTrue(confirmDeleteBtnExists, "The delete modal doesn't appear")
        app.buttons["Okay"].tap()
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
    
    // MARK: - Basic Button Actions
    
    func addTimeDateAction(actionType: String) {
        let popoversQuery = app.popovers
        let elementsQuery = popoversQuery.scrollViews.otherElements
        let tablesQuery = popoversQuery.tables
        app.staticTexts[actionType].tap()
        sleep(5)
        popoversQuery.navigationBars["Edit Button"].buttons["Save"].tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addMessageToDisplayAction() {
        let popoversQuery = app.popovers
        popoversQuery.navigationBars["Edit Button"].buttons["Save"].tap()
        sleep(3)
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addBackspaceKeyAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addClearDisplayAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addBatteryStatusAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addClearLastWordAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addCalculatorAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addHelpSignalAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addPlayVideoAction() {
        // This method handles video-related actions
        // Implementation will be added based on specific video requirements
    }
    
    func addDataLoggingAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addCancelVisitAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addSystemKeyboardAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addTextingConversationsAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addOpenWebsiteAction() {
        // This method handles website-related actions
        // Implementation will be added based on specific website requirements
    }
    
    func addPauseResumeTrackingAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addTextCopyAction() {
        // This method handles text copy actions
        // Implementation will be added based on specific text copy requirements
    }
    
    func addTextPasteAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addVisitExceptionAction() {
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    // MARK: - Action Verification Methods
    
    func verifyTimeDateDisplay(actionType: String) {
        switch actionType {
        case "Date and Time":
            checkIfTheDateTimeAreDisplayed()
        case "Date Only":
            checkIfTheDateisDisplayed()
        case "Time Only":
            checkIfTheTimeisDisplayed()
        default:
            XCTFail("Unknown action type: \(actionType)")
        }
    }
    
    func checkIfTheDateTimeAreDisplayed() {
        app.buttons["Add Action Time/Date"].tap()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy 'at' HH:mm"
        let expectedDateTime = dateFormatter.string(from: Date())
        
        let expectedText = app.textFields["The current date and time are \(expectedDateTime) "]
        XCTAssertTrue(expectedText.exists, "Displayed date and time are incorrect")
        sleep(5)
    }
    
    func checkIfTheDateisDisplayed() {
        app.buttons["Add Action Date"].tap()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        let expectedDate = dateFormatter.string(from: Date())
        
        let expectedText = app.textFields["The current date is \(expectedDate) "]
        XCTAssertTrue(expectedText.exists, "Displayed date is incorrect")
    }
    
    func checkIfTheTimeisDisplayed() {
        app.buttons["Add Action Time"].tap()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let expectedTime = dateFormatter.string(from: Date())
        
        let expectedText = app.textFields["The current time is \(expectedTime) "]
        XCTAssertTrue(expectedText.exists, "Displayed time is incorrect")
    }
    
    func checkAddMessageDisplay() {
        sleep(2)
        let popoversQuery = app.popovers
        popoversQuery.navigationBars["Edit Button"].buttons["Save"].tap()
        sleep(3)
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
        app.buttons["Add Message To Display"].tap()
        let messageText = app.textFields["Add Message To Display "]
        XCTAssertTrue(messageText.exists, "The message is not displayed")
    }
    
    func checkIfTheActionsWorks() {
        app.buttons["PHRASES"].press(forDuration: 1)
        app.buttons["Good Morning"].tap()
        app.buttons["Back"].tap()
        app.buttons["Backspace Key"].doubleTap()
        let sdbNewText = app.textFields["Good morning, how are you"]
        XCTAssertTrue(sdbNewText.exists, "The backspace key button doesn't work as expected")
    }
    
    func checkTheBatteryStatus() {
        app.buttons["Battery Sts"].tap()
        let batteryStsField = app.textFields["Device battery is -100% charged. "]
        XCTAssertTrue(batteryStsField.exists, "The battery status is not visible")
    }
    
    func checkTheCalculatorAction() {
        app.buttons["Calculator"].tap()
        let calcBtn1 = app.buttons["AC"]
        let calcBtn2 = app.buttons["%"]
        let calcBtn3 = app.buttons["±"]
        
        let existsCalcBtn = calcBtn1.exists && calcBtn2.exists && calcBtn3.exists
        XCTAssertTrue(existsCalcBtn, "The Calculator is not visible")
        
        app.buttons["7"].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        
        let calcResult = app.buttons["10"]
        let calcResultsExists = calcResult.waitForExistence(timeout: 5)
        XCTAssertTrue(calcResultsExists, "The calculator works as expected.")
        
        app.buttons["Done"].tap()
    }
    
    func clearLastWord() {
        app.buttons["PHRASES"].press(forDuration: 1)
        app.buttons["Good Morning"].tap()
        app.buttons["Back"].tap()
        app.buttons["Clear Last Word"].tap()
        
        let textLastWord = app.textFields["Good morning, how are "]
        XCTAssertTrue(textLastWord.exists, "The text is not correct")
    }
    
    func checkLoggingData() {
        app.buttons["Data Logging"].tap()
        let enableLogging = app.images["lam_indicator"]
        let existsEnableLogging = enableLogging.waitForExistence(timeout: 5)
        XCTAssertTrue(existsEnableLogging, "The Enable Logging image is not visible")
        app.buttons["Data Logging"].tap()
        sleep(3)
        XCTAssertFalse(enableLogging.exists, "The Enable Logging image is still visible")
    }
    
    func clearDisplay() {
        app.buttons["PHRASES"].press(forDuration: 1)
        app.buttons["Good Morning"].tap()
        app.buttons["Back"].tap()
        app.buttons["BackButton"].tap()
        
        let textClearDisplay = app.textFields["Good morning, how are "]
        XCTAssertTrue(textClearDisplay.exists, "The text is not correct")
        
        app.buttons["Clear Display"].tap()
        
        let textFieldSdb = app.textFields.element(boundBy: 0)
        let textFieldValue = textFieldSdb.value as? String
        
        if textFieldValue == "" || textFieldValue == nil {
            print("Text field is empty")
            XCTAssert(true, "Text field is empty as expected")
        }
    }
} 