import XCTest

final class WaitPageExampleTests: BaseTest {
    
    func testWaitPageUsageExamples() throws {
        // MARK: - Basic Wait Examples
        
        // Short wait (2 seconds)
        pages.waitPage.waitShort()
        
        // Medium wait (5 seconds)
        pages.waitPage.waitMedium()
        
        // Long wait (10 seconds)
        pages.waitPage.waitLong()
        
        // Extra long wait (15 seconds)
        pages.waitPage.waitExtraLong()
        
        // Custom duration wait
        pages.waitPage.wait(duration: 3.5)
        
        // MARK: - Element Wait Examples
        
        // Wait for a button to exist
        let buttonExists = pages.waitPage.waitForButtonToExist("Some Button")
        XCTAssertTrue(buttonExists, "Button should exist")
        
        // Wait for a button to be hittable
        pages.waitPage.waitForButtonToBeHittable("Some Button")
        
        // Wait for text to appear
        pages.waitPage.waitForText("Expected Text")
        
        // Wait for text to disappear
        pages.waitPage.waitForTextToDisappear("Temporary Text")
        
        // Wait for text field
        pages.waitPage.waitForTextField("Email Field")
        
        // Wait for secure text field
        pages.waitPage.waitForSecureTextField("Password Field")
        
        // MARK: - Navigation Wait Examples
        
        // Wait for navigation bar
        pages.waitPage.waitForNavigationBar("Settings")
        
        // Wait for tab bar
        pages.waitPage.waitForTabBar("Home")
        
        // MARK: - UI Component Wait Examples
        
        // Wait for alert
        pages.waitPage.waitForAlert("Error Alert")
        
        // Wait for sheet
        pages.waitPage.waitForSheet("Action Sheet")
        
        // Wait for popover
        pages.waitPage.waitForPopover("Options Popover")
        
        // Wait for activity indicator to disappear
        pages.waitPage.waitForActivityIndicatorToDisappear()
        
        // Wait for keyboard to appear
        pages.waitPage.waitForKeyboardToAppear()
        
        // Wait for keyboard to disappear
        pages.waitPage.waitForKeyboardToDisappear()
        
        // MARK: - Conditional Wait Examples
        
        // Wait until a condition is met
        pages.waitPage.waitUntil({
            return app.staticTexts["Loading Complete"].exists
        }, timeout: 10)
        
        // Wait until element exists
        let elementExists = pages.waitPage.waitUntilElementExists(app.buttons["Dynamic Button"])
        XCTAssertTrue(elementExists, "Dynamic button should appear")
        
        // MARK: - Utility Wait Examples
        
        // Wait for app to be ready
        pages.waitPage.waitForAppToBeReady()
        
        // Wait for background process
        pages.waitPage.waitForBackgroundProcess()
        
        // Wait for page to load
        pages.waitPage.waitForPageToLoad()
        
        // Wait for animation to complete
        pages.waitPage.waitForAnimationToComplete()
        
        // Wait for network request
        pages.waitPage.waitForNetworkRequest()
        
        print("WaitPage Example Test Finished Successfully!")
    }
    
    func testWaitPageWithCustomTimeouts() throws {
        // MARK: - Custom Timeout Examples
        
        // Wait for element with custom timeout
        pages.waitPage.waitForElement(app.buttons["Slow Button"], timeout: 20)
        
        // Wait for text with short timeout
        pages.waitPage.waitForText("Quick Text", timeout: 3)
        
        // Wait for button with long timeout
        pages.waitPage.waitForButton("Slow Loading Button", timeout: 25)
        
        // Wait for alert with extra long timeout
        pages.waitPage.waitForAlert("Complex Alert", timeout: 30)
        
        print("WaitPage Custom Timeout Test Finished Successfully!")
    }
    
    func testWaitPageErrorHandling() throws {
        // MARK: - Error Handling Examples
        
        // This will fail if the element doesn't exist within the timeout
        // The error message will include the file and line number
        do {
            pages.waitPage.waitForText("Non-existent Text", timeout: 2)
            XCTFail("This should have failed")
        } catch {
            // Expected failure
        }
        
        // This will fail if the element doesn't disappear within the timeout
        do {
            pages.waitPage.waitForElementToDisappear(app.buttons["Persistent Button"], timeout: 2)
            XCTFail("This should have failed")
        } catch {
            // Expected failure
        }
        
        print("WaitPage Error Handling Test Finished Successfully!")
    }
} 