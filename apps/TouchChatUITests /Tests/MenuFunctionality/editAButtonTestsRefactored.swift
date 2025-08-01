import XCTest

final class editAButtonTestsRefactored: BaseTest {
    
    // MARK: - Test Configuration
    private let testVocabName = "copied vocabulary edit button"
    private let testVocabDescription = "vocabulary description e2e"
    
    func testEditAButton() throws {
        // MARK: - Given (Test Setup)
        createTestVocabulary(name: testVocabName, description: testVocabDescription)
        
        // Open the test vocabulary
        pages.mainPage.openVocab(
            , 
            vocab: testVocabName
        )
        
        // MARK: - When (Test Actions)
        // Enable delete vocab option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // Open the Edit Page tab
        pages.editPage.editPage()
        
        // Edit button properties
        pages.editPage.editThisButton()
        
        // Check if the iOS Gallery is opening
        checkiOSGallery()
        
        // Select image
        pages.editPage.selectImageButton()
        
        // Verify all switches work
        pages.editPage.checkSwitchesEditButton()
        
        // Check font options
        checkFontOptions(fontName: "Ubuntu")
        
        // Check point options
        checkPointOptions(pointField: "12 Point")
        
        // Check color options
        checkTextColorOptions()
        checkBodyColorOptions(bodyColor: "#ffff99")
        checkBorderColorOptions()
        checkBorderWidthOptions(borderPoint: "1 Point")
        
        // Add an action for the button
        pages.editPage.addActionButton(buttonName: "Edit Button by e2e")
        
        // MARK: - Then (Verification)
        // Verify the button text appears in Speech Display Bar
        pages.common.checkSdbText(sdbText: "Edit Button by e2e ")
        
        // Test button size change functionality
        pages.editPage.changeButtonSize(buttonName: "Edit Button by e2e")
        
        // Clean up: remove the button
        pages.editPage.removeTheButton(buttonName: "Edit Button by e2e")
        
        // MARK: - Cleanup
        cleanupTestVocabulary(name: testVocabName)
        
        print("✅ Edit Button Test Finished Successfully!")
    }
    
    // MARK: - Helper Methods (These will be moved to appropriate page classes later)
    private func checkiOSGallery() {
        sleep(2)
        let elementsQuery = XCUIApplication().popovers.scrollViews.otherElements
        elementsQuery.buttons["Import Photo"].tap()
        let photosBtn = app.staticTexts["Photos"]
        let photosBtnExists = photosBtn.waitForExistence(timeout: 8)
        XCTAssertTrue(photosBtnExists, "The iOS gallery is not opening")
        let centerScreenCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: 0.1, dy: 0.2))
        // centerScreenCoordinate.tap()
        sleep(3)
    }
    
    private func checkFontOptions(fontName: String) {
        XCUIApplication().popovers.scrollViews.otherElements.buttons[fontName].tap()
        
        let expectedFonts = ["Amaranth", "Caudex", "Gentium Basic", "Arial", "Courier New", "Georgia"]
        
        for font in expectedFonts {
            let fontElement = app.staticTexts[font]
            XCTAssertTrue(fontElement.exists, "Font \(font) is not available")
        }
    }
    
    private func checkPointOptions(pointField: String) {
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
        popoversQuery.scrollViews.otherElements.buttons[pointField].tap()
        app.staticTexts["7 Point"].tap()
        
        let checkFontSize = app.staticTexts["7 Point"].waitForExistence(timeout: 5)
        XCTAssertTrue(checkFontSize, "The Font Size is not correct")
    }
    
    private func checkTextColorOptions() {
        let popoversQuery = XCUIApplication().popovers
        XCUIApplication().popovers.scrollViews.otherElements.containing(.staticText, identifier:"Button Label").children(matching: .button).matching(identifier: "Black").element(boundBy: 0).tap()
        
        let expectedColors = ["Red", "Brown", "Lime", "Skyblue", "Lavender"]
        
        for color in expectedColors {
            let colorElement = app.staticTexts[color]
            XCTAssertTrue(colorElement.exists, "Text color \(color) is not available")
        }
        
        popoversQuery.navigationBars["Select Color"].buttons["Cancel"].tap()
    }
    
    private func checkBodyColorOptions(bodyColor: String) {
        let popoversQuery = XCUIApplication().popovers
        
        popoversQuery.scrollViews.otherElements.buttons[bodyColor].tap()
        let expectedColors = ["Red", "Brown", "Lime", "Skyblue", "Lavender"]
        
        for color in expectedColors {
            let colorElement = app.staticTexts[color]
            XCTAssertTrue(colorElement.exists, "Body color \(color) is not available")
        }
        
        popoversQuery.navigationBars["Select Color"].buttons["Cancel"].tap()
    }
    
    private func checkBorderColorOptions() {
        XCUIApplication().popovers.scrollViews.otherElements.containing(.staticText, identifier:"Button Label").children(matching: .button).matching(identifier: "Black").element(boundBy: 1).tap()
        
        let expectedColors = ["Red", "Brown", "Lime", "Skyblue", "Lavender"]
        
        for color in expectedColors {
            let colorElement = app.staticTexts[color]
            XCTAssertTrue(colorElement.exists, "Border color \(color) is not available")
        }
        
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.navigationBars["Select Color"].buttons["Cancel"].tap()
    }
    
    private func checkBorderWidthOptions(borderPoint: String) {
        XCUIApplication().popovers.scrollViews.otherElements.buttons[borderPoint].tap()
        
        let expectedWidths = ["1 Point", "15 Point", "20 Point"]
        
        for width in expectedWidths {
            let widthElement = app.staticTexts[width]
            XCTAssertTrue(widthElement.exists, "Border width \(width) is not available")
        }
        
        app.staticTexts["20 Point"].tap()
    }
} 