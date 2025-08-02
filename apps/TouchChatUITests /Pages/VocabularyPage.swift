import XCTest

class VocabularyPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Vocabulary Selection Methods
    
    // English Vocabularies
    func selectBasic4SS() {
        app.tables.staticTexts["Simple 4-Basic SS"].tap()
    }
    
    func selectEngageForiOS() {
        app.tables.staticTexts["Engage for iOS SS"].tap()
    }
    
    func selectMyCoreSS() {
        app.tables.staticTexts["MyCore SS"].tap()
    }
    
    func selectSpellingSS() {
        app.tables.staticTexts["Spelling SS"].tap()
    }
    
    func selectVocabPCSS() {
        app.tables.staticTexts["VocabPC SS"].tap()
    }
    
    func selectWordPower25SS() {
        app.tables.staticTexts["WordPower25 SS"].tap()
    }
    
    func selectWordPower42SS() {
        app.tables.staticTexts["WordPower42 SS"].tap()
    }
    
    func selectWordPower42BasicSS() {
        app.tables.staticTexts["WordPower42 Basic SS"].tap()
    }
    
    func selectWordPower48SS() {
        app.tables.staticTexts["WordPower48 SS"].tap()
    }
    
    func selectWordPower48BasicSS() {
        app.tables.staticTexts["WordPower48 Basic SS"].tap()
    }
    
    func selectWordPower60SS() {
        app.tables.staticTexts["WordPower60 SS"].tap()
    }
    
    func selectWordPower60BasicSS() {
        app.tables.staticTexts["WordPower60 Basic SS"].tap()
    }
    
    func selectWordPower80SS() {
        app.tables.staticTexts["WordPower80 SS"].tap()
    }
    
    func selectWordPower108SS() {
        app.tables.staticTexts["WordPower108 SS"].tap()
    }
    
    func selectWordPower108KeyboardSS() {
        app.tables.staticTexts["WordPower108 Keyboard SS"].tap()
    }
    
    func selectWordPower140SS() {
        app.tables.staticTexts["WordPower140 SS"].tap()
    }
    
    func selectWordPower20SimplySS() {
        app.tables.staticTexts["WordPower20 Simply SS"].tap()
    }
    
    // MultiChat English Vocabularies
    func selectMultiChat15AdultSS() {
        app.tables.staticTexts["MultiChat15 Adult SS"].tap()
    }
    
    func selectMultiChat15AdolescentSS() {
        app.tables.staticTexts["MultiChat15 Adolescent SS"].tap()
    }
    
    func selectMultiChat15StudentSS() {
        app.tables.staticTexts["MultiChat15 Student SS"].tap()
    }
    
    // Aphasia English Vocabularies
    func selectAphasiaUSSS() {
        app.tables.staticTexts["Aphasia US SS"].tap()
    }
    
    func selectAphasiaUKSS() {
        app.tables.staticTexts["Aphasia UK SS"].tap()
    }
    
    // QuickChat English Vocabularies
    func selectMyQuickChatChild4SS() {
        app.tables.staticTexts["My QuickChat Child 4 SS"].tap()
    }
    
    func selectMyQuickChatChild8SS() {
        app.tables.staticTexts["My QuickChat Child 8 SS"].tap()
    }
    
    func selectMyQuickChatChild12SS() {
        app.tables.staticTexts["My QuickChat Child 12 SS"].tap()
    }
    
    func selectMyQuickChatAdult8SS() {
        app.tables.staticTexts["My QuickChat Adult 8 SS"].tap()
    }
    
    func selectMyQuickChatAdult12SS() {
        app.tables.staticTexts["My QuickChat Adult 12 SS"].tap()
    }
    
    func selectSintaxis4x4English() {
        app.tables.staticTexts["sin sintaxis 4 x 4 English SS"].tap()
    }
    
    func selectSintaxis4x5English() {
        app.tables.staticTexts["sintaxis 4 x 5 English SS"].tap()
    }
    
    // Spanish Vocabularies
    func selectWordPower25Espanol() {
        app.tables.staticTexts["WordPower25 Español SS"].tap()
    }
    
    func selectWordPower48Espanol() {
        app.tables.staticTexts["WordPower 48 Español SS"].tap()
    }
    
    func selectWordPower48EspanolBasico() {
        app.tables.staticTexts["WordPower48 Español Básico SS"].tap()
    }
    
    func selectWordPower60EspanolBasico() {
        app.tables.staticTexts["WordPower60 Español Básico SS"].tap()
    }
    
    func selectWordPower96EspanolLiteTech() {
        app.tables.staticTexts["WordPower96 Español Lite-Tech SS"].tap()
    }
    
    func selectAphasiaSpanish() {
        app.tables.staticTexts["Afasia Español SS"].tap()
    }
    
    func selectMultiChat15Spanish() {
        app.tables.staticTexts["MultiChat15 Spanish SS"].tap()
    }
    
    func selectMultiChat15Bilingual() {
        app.tables.staticTexts["MultiChat 15 Spanish Bilingual SS"].tap()
    }
    
    func selectSintaxis4x4Spanish() {
        app.tables.staticTexts["sin sintaxis 4 x 4 Spanish SS"].tap()
    }
    
    func selectSintaxis4x5Spanish() {
        app.tables.staticTexts["sintaxis 4 x 5 Spanish SS"].tap()
    }
    
    func selectTecladoSS() {
        app.tables.staticTexts["Teclado SS"].tap()
    }
    
    func selectVocabPCSpanish() {
        app.tables.staticTexts["Vocab PC Spanish SS"].tap()
    }
    
    // French Vocabularies
    func selectBase4French() {
        app.tables.staticTexts["4 de base français SS"].tap()
    }
    
    func selectCommunicationFrancais() {
        app.tables.staticTexts["Communication Journey Aphasie français SS"].tap()
    }
    
    func selectMultiChat15Francais() {
        app.tables.staticTexts["MultiChat15 français SS"].tap()
    }
    
    func selectVocabPCFrancais() {
        app.tables.staticTexts["VocabPC français SS"].tap()
    }
    
    func selectEpelerFrancais() {
        app.tables.staticTexts["Épeler français SS"].tap()
    }
    
    func selectWordPower120Azerty() {
        app.tables.staticTexts["WordPower120 français AZERTY SS"].tap()
    }
    
    func selectWordPower120Francais() {
        app.tables.staticTexts["WordPower120 français SS"].tap()
    }
    
    func selectWordPower60Francais() {
        app.tables.staticTexts["WordPower60 français SS"].tap()
    }
    
    // MARK: - Vocabulary Verification Methods
    
    func verifyVocabulary(lastElement: String, vocabWord: String, vocabElement: Int, nameElement: String) {
        sleep(3)
        let lastElementVocab = app.buttons[lastElement]
        let existsTheElement = lastElementVocab.waitForExistence(timeout: 15)
        XCTAssertTrue(existsTheElement, "The last element of the vocabulary is not visible")
        
        let elements = app.buttons.allElementsBoundByIndex
        let vocabElementNumber = elements[vocabElement]
        let vocabWordVocab = app.buttons[vocabWord]
        let nameElementVocab = app.buttons[nameElement]
        
        XCTAssertGreaterThan(elements.count, 3, "There are not enough elements")
        XCTAssertEqual(vocabElementNumber.label, nameElement, "The title is not correct")
        XCTAssertTrue(vocabWordVocab.exists)
        
        vocabWordVocab.press(forDuration: 2)
    }
    
    func verifyVocabularyElementExists(_ elementName: String, timeout: TimeInterval = 10) -> Bool {
        let element = app.buttons[elementName]
        return element.waitForExistence(timeout: timeout)
    }
    
    func tapVocabularyElement(_ elementName: String) {
        let element = app.buttons[elementName]
        XCTAssertTrue(element.waitForExistence(timeout: 10), "Vocabulary element '\(elementName)' not found")
        element.tap()
    }
    
    func tapBackButton() {
        let backButton = app.buttons["BackButton"]
        XCTAssertTrue(backButton.waitForExistence(timeout: 5), "Back button not found")
        backButton.tap()
    }
    
    // MARK: - Speech Display Bar Methods
    
    func verifySpeechDisplayBarText(expectedText: String) {
        let sdbElement = app.textFields[expectedText]
        XCTAssertTrue(sdbElement.exists, "Speech Display Bar text '\(expectedText)' not found")
    }
    
    func checkSpeechDisplayBarText(_ text: String) {
        let sdbElement = app.textFields[text]
        XCTAssertTrue(sdbElement.exists, "Speech Display Bar text '\(text)' not found")
    }
    
    // MARK: - Navigation Methods
    
    func openVocabulary() {
        // This method opens the selected vocabulary
        // Implementation depends on the specific vocabulary type
        sleep(2)
    }
    
    func navigateBackToVocabularyList() {
        // Navigate back to the vocabulary selection screen
        let vocabButton = app.navigationBars.buttons["Vocab"]
        if vocabButton.waitForExistence(timeout: 5) {
            vocabButton.tap()
            let chooseNewVocab = app.popovers.scrollViews.otherElements.buttons["Choose New Vocab"]
            if chooseNewVocab.waitForExistence(timeout: 5) {
                chooseNewVocab.tap()
            }
        }
    }
    
    // MARK: - Utility Methods
    
    func waitForVocabularyToLoad(timeout: TimeInterval = 10) {
        // Wait for vocabulary to fully load
        sleep(3)
    }
    
    func verifyTheVocab(lastElement: String, vocabWord: String, vocabElement: NSInteger, nameElement: String){
        sleep(3)
        let lastElementVocab = app.buttons[lastElement]
        let existsTheElement = lastElementVocab.waitForExistence(timeout: 15)
        XCTAssertTrue(existsTheElement, "The last element of the vocabulary is not visible")
        
        let elements = app.buttons.allElementsBoundByIndex
        let vocabElementNumber = elements[vocabElement]
        let vocabWordVocab = app.buttons[vocabWord]
        let nameElementVocab = app.buttons[nameElement]
        
        XCTAssertGreaterThan(elements.count, 3, "There are not enough elements")
        XCTAssertEqual(vocabElementNumber.label, nameElement, "The title is not correct")
        XCTAssertTrue(vocabWordVocab.exists);
        
        vocabWordVocab.press(forDuration: 2)
    }

    func scrollToVocabularyElement(element: XCUIElement, maxScrolls: Int = 5) {
        var scrollAttempts = 0
        while !element.exists && scrollAttempts < maxScrolls {
            app.swipeUp()
            scrollAttempts += 1
            sleep(1)
        }
    }
} 
