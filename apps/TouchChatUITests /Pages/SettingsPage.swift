import XCTest

class SettingsPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Settings Access
    func ensureAllowDeleteIsOn() {
        sleep(3)
        let allowDeleteSwitch = app.switches.element(boundBy: 7)
        if allowDeleteSwitch.value as? String == "0" {
            allowDeleteSwitch.tap()
        }
        app.buttons["Done"].tap()
    }
    
    func openPageStyleOverride() {
        sleep(3)
        app.navigationBars["SPKBD-QWERTY"].buttons["Menu"].tap()
        app.popovers.scrollViews.otherElements.buttons["Page Style Override"].tap()
    }
    
    func checkTheToggleandSwitchIt() {
        let toggle = app.switches["0"]
        XCTAssertTrue(toggle.waitForExistence(timeout: 5), "The toggle does not exist")
        
        let initialState = toggle.value as! String
        print("Initial State: \(initialState)")
        
        if initialState == "0" {
            toggle.tap()
        }
        
        sleep(3)
        
        let toggleON = app.switches["1"]
        
        let newState = toggleON.value as! String
        print("New state: \(newState)")
        
        XCTAssertEqual(newState, "1", "The toggle is not ON as expected")
    }
    
    // TODO: Add more settings functionality as needed
} 