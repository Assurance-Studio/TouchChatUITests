import XCTest

class ModifiersPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Import Vocabulary
    func importVocab() {
        app.buttons["Import/Export Vocab"].tap()
        sleep(2)
        app.buttons["Import from Files"].tap()
        sleep(5)
        app.staticTexts["Downloads"].tap()
        app.staticTexts["000_nmodifiers.ce"].tap()
        app.buttons["Open"].tap()
        sleep(3)
        
        app.textFields["Description of the voab ulary file"].tap()
        app.textFields["Description of the voab ulary file"].typeText("modifiers vocab")
        app.buttons["Import"].tap()
    }
    
    // MARK: - Navigation
    func openModifiersVocab() {
        app.staticTexts["000_modifiers"].tap()
        sleep(3)
        app.buttons["gotomodif"].tap()
    }
    
    // MARK: - Modifier Button Tests
    func checkShiftBtn() {
        let shiftBtn = app.buttons["Shift"]
        let expectedShiftBtn = app.buttons["Shift mod"]
        shiftBtn.tap()
        XCTAssertTrue(expectedShiftBtn.exists, "The expected Shift Btn is not visible")
    }
    
    func checkCTRLBtn() {
        let ctrlBtn = app.buttons["CTRL"]
        let expectedCTRLBtn = app.buttons["Control Mod"]
        ctrlBtn.tap()
        XCTAssertTrue(expectedCTRLBtn.exists, "The CTRL Btn is not visible")
    }
    
    func checkCapsBtn() {
        let capsBtn = app.buttons["Caps"]
        let expectedCapsBtn = app.buttons["Caps Lock"]
        capsBtn.tap()
        XCTAssertTrue(expectedCapsBtn.exists, "The Caps Btn is not visible")
    }
    
    func checkNumBtn() {
        let numBtn = app.buttons["Num"]
        let expectedNumBtn = app.buttons["Num Lock"]
        numBtn.tap()
        XCTAssertTrue(expectedNumBtn.exists, "The Num Btn is not visible")
    }
    
    func checkClearAllModifiersBtn() {
        let expectedNumBtn = app.buttons["Num Lock"]
        let fnJButton = app.buttons["Function Lock J"]
        let fnTButton = app.buttons["FN Lock T"]
        
        let expectedButtons = expectedNumBtn.exists && fnJButton.exists && fnTButton.exists
        XCTAssertTrue(expectedButtons, "The expected buttons are not present")
        
        app.buttons["Clear All Modifiers"].tap()
        sleep(5)
        
        XCTAssertFalse(fnJButton.exists, "The expected button is still present")
        XCTAssertFalse(expectedNumBtn.exists, "The expected button is still present")
        XCTAssertFalse(fnTButton.exists, "The expected button is still present")
        
        // Back to vocab
        app.buttons["Back"].tap()
    }
    
    // MARK: - FN Row Tests
    func testFnRow1() {
        for i in 1...35 {
            let buttonID = "Fn\(i)"
            let labelText = "Function \(i)"
            
            // Press the button
            let button = app.buttons[buttonID]
            XCTAssertTrue(button.exists, "Button \(buttonID) does not exist.")
            button.tap()
            
            let labelID = "Function \(i)"
            let label = app.buttons[labelID]
            XCTAssertTrue(label.exists, "Label \(labelID) does not exist.")
            XCTAssertEqual(label.label, labelText, "Label \(labelID) did not update correctly.")
        }
    }
    
    func testFnRow2() {
        for i in 36...79 {
            let buttonID = "Fn\(i)"
            let labelText = "FN \(i)"
            
            // Press the button
            let button = app.buttons[buttonID]
            XCTAssertTrue(button.exists, "Button \(buttonID) does not exist.")
            button.tap()
            
            let labelID = "FN \(i)"
            let label = app.buttons[labelID]
            XCTAssertTrue(label.exists, "Label \(labelID) does not exist.")
            XCTAssertEqual(label.label, labelText, "Label \(labelID) did not update correctly.")
        }
    }
    
    func testFnRow3() {
        for i in 81...100 {
            let buttonID = "Fn\(i)"
            let labelText = "FN \(i)"
            
            // Press the button
            let button = app.buttons[buttonID]
            XCTAssertTrue(button.exists, "Button \(buttonID) does not exist.")
            button.tap()
            
            let labelID = "FN \(i)"
            let label = app.buttons[labelID]
            XCTAssertTrue(label.exists, "Label \(labelID) does not exist.")
            XCTAssertEqual(label.label, labelText, "Label \(labelID) did not update correctly.")
        }
    }
    
    // MARK: - Lock Row Tests
    func testFirstRowLock() {
        let letters = "ABCDEFGHIJ"
        for letter in letters {
            let buttonID = "Fn Lock \(letter)"
            let labelText = "Function Lock \(letter)"
            
            // Press the button
            let button = app.buttons[buttonID]
            XCTAssertTrue(button.exists, "Button \(buttonID) does not exist.")
            button.tap()
            
            let labelID = "Function Lock \(letter)"
            let label = app.buttons[labelID]
            XCTAssertTrue(label.exists, "Label \(labelID) does not exist.")
            XCTAssertEqual(label.label, labelText, "Label \(labelID) did not update correctly.")
        }
    }
    
    func testSecondRowLock() {
        let letters = "KLMNOPQRST"
        for letter in letters {
            let buttonID = "Fn Lock \(letter)"
            let labelText = "FN Lock \(letter)"
            
            // Press the button
            let button = app.buttons[buttonID]
            XCTAssertTrue(button.exists, "Button \(buttonID) does not exist.")
            button.tap()
            
            let labelID = "FN Lock \(letter)"
            let label = app.buttons[labelID]
            XCTAssertTrue(label.exists, "Label \(labelID) does not exist.")
            XCTAssertEqual(label.label, labelText, "Label \(labelID) did not update correctly.")
        }
    }
} 