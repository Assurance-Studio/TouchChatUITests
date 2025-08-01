import XCTest

class LanguageSelectionPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Language Selection Methods
    
    func openLanguageAndRegionSettings() {
        app.buttons["Menu"].tap()
        app.buttons["Language & Region"].tap()
        sleep(2)
    }
    
    func addLanguage(languageName: String) {
        openLanguageAndRegionSettings()
        XCUIApplication().popovers.navigationBars["Language & Region"].buttons["Add"].tap()
        app.staticTexts[languageName].tap()
        app.buttons["Done"].tap()
    }
    
    func selectLanguageIfExists(languageName: String) {
        openLanguageAndRegionSettings()
        let languageType = app.staticTexts[languageName]
        if languageType.exists {
            app.buttons["Done"].tap()
        } else {
            XCUIApplication().popovers.navigationBars["Language & Region"].buttons["Add"].tap()
            app.staticTexts[languageName].tap()
            app.buttons["Done"].tap()
        }
    }
    
    // MARK: - Language-Specific Methods
    
    func selectSpanishLanguage() {
        selectLanguageIfExists("Spanish (United States)")
    }
    
    func selectFrenchLanguage() {
        selectLanguageIfExists("French (Canada)")
    }
    
    func selectEnglishLanguage() {
        selectLanguageIfExists("English (United States)")
    }
    
    // MARK: - Vocabulary Language Selection
    
    func selectSpanishVocabulary() {
        let spanishVocab = app.staticTexts["Spanish"]
        scrollToElement(spanishVocab)
        spanishVocab.tap()
    }
    
    func selectFrenchVocabulary() {
        let frenchVocab = app.staticTexts["French"]
        scrollToElement(frenchVocab)
        frenchVocab.tap()
    }
    
    func selectEnglishVocabulary() {
        let englishVocab = app.staticTexts["English"]
        scrollToElement(englishVocab)
        englishVocab.tap()
    }
    
    // MARK: - Utility Methods
    
    func scrollToElement(_ element: XCUIElement, maxScrolls: Int = 5) {
        var scrollAttempts = 0
        while !element.exists && scrollAttempts < maxScrolls {
            app.swipeUp()
            scrollAttempts += 1
            sleep(1)
        }
    }
    
    func waitForLanguageToLoad(timeout: TimeInterval = 10) {
        sleep(3)
    }
    
    func verifyLanguageIsSelected(languageName: String) -> Bool {
        let languageElement = app.staticTexts[languageName]
        return languageElement.exists
    }
} 