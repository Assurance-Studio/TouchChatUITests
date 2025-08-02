import XCTest

class VocabularyPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Vocabulary Selection Methods
    
    // English Vocabularies
    func selectBasic4SS() {
        let simple4BasicSSElement = app.tables.staticTexts["Simple 4-Basic SS"]
        scrollToVocabularyElement(element: simple4BasicSSElement)
        simple4BasicSSElement.tap()
    }
    
    func selectEngageForiOS() {
        let engageForIOSElement = app.tables.staticTexts["Engage for iOS SS"]
        scrollToVocabularyElement(element: engageForIOSElement)
        engageForIOSElement.tap()
    }
    
    func selectMyCoreSS() {
        let myCoreSSElement = app.tables.staticTexts["MyCore SS"]
        scrollToVocabularyElement(element: myCoreSSElement)
        myCoreSSElement.tap()
    }
    
    func selectSpellingSS() {
        let spellingSSElement = app.tables.staticTexts["Spelling SS"]
        scrollToVocabularyElement(element: spellingSSElement)
        spellingSSElement.tap()
    }
    
    func selectVocabPCSS() {
        let vocabPCSSElement = app.tables.staticTexts["VocabPC SS"]
        scrollToVocabularyElement(element: vocabPCSSElement)
        vocabPCSSElement.tap()
    }
    
    func selectWordPower() {
        let wordPowerVocabularies = app.tables.staticTexts["WordPower"]
        scrollToVocabularyElement(element: wordPowerVocabularies)
        wordPowerVocabularies.tap()
    }

    func selectMyQuickChat() {
        let myQuickChat = app.tables.staticTexts["My QuickChat"]
        scrollToVocabularyElement(element: myQuickChat)
        myQuickChat.tap()
    }
    
    func selectWordPower25SS() {
        let wordPower25Position = app.tables.staticTexts["25 Position"]
        let wordPower25SSElement = app.tables.staticTexts["WordPower25 SS"]
        scrollToVocabularyElement(element: wordPower25Position)
        wordPower25Position.tap()
        scrollToVocabularyElement(element: wordPower25SSElement)
        wordPower25SSElement.tap()
    }
    
    func selectWordPower42SS() {
        let wordPower42Position = app.tables.staticTexts["42 Position"]
        let wordPower42SSElement = app.tables.staticTexts["WordPower42 SS"]
        scrollToVocabularyElement(element: wordPower42Position)
        wordPower42Position.tap()
        scrollToVocabularyElement(element: wordPower42SSElement)
        wordPower42SSElement.tap()
    }
    
    func selectWordPower42BasicSS() {
        let wordPower42Position = app.tables.staticTexts["42 Position"]
        let wordPower42BasicSSElement = app.tables.staticTexts["WordPower42 Basic SS"]
        scrollToVocabularyElement(element: wordPower42BasicPosition)
        wordPower42BasicPosition.tap()
        scrollToVocabularyElement(element: wordPower42BasicSSElement)
        wordPower42BasicSSElement.tap()
    }
    
    func selectWordPower48SS() {
        let wordPower48Position = app.tables.staticTexts["48 Position"]
        let wordPower48SSElement = app.tables.staticTexts["WordPower48 SS"]
        scrollToVocabularyElement(element: wordPower48Position)
        wordPower48Position.tap()
        scrollToVocabularyElement(element: wordPower48SSElement)
        wordPower48SSElement.tap()
    }
    
    func selectWordPower48BasicSS() {
        let wordPower48Position = app.tables.staticTexts["48 Position"]
        let wordPower48BasicSSElement = app.tables.staticTexts["WordPower48 Basic SS"]
        scrollToVocabularyElement(element: wordPower48Position)
        wordPower48Position.tap()
        scrollToVocabularyElement(element: wordPower48BasicSSElement)
        wordPower48BasicSSElement.tap()
    }
    
    func selectWordPower60SS() {
        let wordPower60Position = app.tables.staticTexts["60 Position"]
        let wordPower60SSElement = app.tables.staticTexts["WordPower60 SS"]
        scrollToVocabularyElement(element: wordPower60Position)
        wordPower60Position.tap()
        scrollToVocabularyElement(element: wordPower60SSElement)
        wordPower60SSElement.tap()
    }
    
    func selectWordPower60BasicSS() {
        let wordPower60Position = app.tables.staticTexts["60 Position"]
        let wordPower60BasicSSElement = app.tables.staticTexts["WordPower60 Basic SS"]
        scrollToVocabularyElement(element: wordPower60Position)
        wordPower60Position.tap()
        scrollToVocabularyElement(element: wordPower60BasicSSElement)
        wordPower60BasicSSElement.tap()
    }
    
    func selectWordPower80SS() {
        let wordPower80Position = app.tables.staticTexts["80 Position"]
        let wordPower80SSElement = app.tables.staticTexts["WordPower80 SS"]
        scrollToVocabularyElement(element: wordPower80Position)
        wordPower80Position.tap()
        scrollToVocabularyElement(element: wordPower80SSElement)
        wordPower80SSElement.tap()
    }
    
    func selectWordPower108SS() {
        let wordPower108Position = app.tables.staticTexts["108 Position"]
        let wordPower108SSElement = app.tables.staticTexts["WordPower108 SS"]
        scrollToVocabularyElement(element: wordPower108Position)
        wordPower108Position.tap()
        scrollToVocabularyElement(element: wordPower108SSElement)
        wordPower108SSElement.tap()
    }
    
    func selectWordPower108KeyboardSS() {
        let wordPower108Position = app.tables.staticTexts["108 Position"]
        let wordPower108KeyboardSSElement = app.tables.staticTexts["WordPower108 Keyboard SS"]
        scrollToVocabularyElement(element: wordPower108Position)
        wordPower108Position.tap()
        scrollToVocabularyElement(element: wordPower108KeyboardSSElement)
        wordPower108KeyboardSSElement.tap()
    }
    
    func selectWordPower140SS() {
        let wordPower140Position = app.tables.staticTexts["140 Position"]
        let wordPower140SSElement = app.tables.staticTexts["WordPower140 SS"]
        scrollToVocabularyElement(element: wordPower140Position)
        wordPower140Position.tap()
        scrollToVocabularyElement(element: wordPower140SSElement)
        wordPower140SSElement.tap()
    }
    
    func selectWordPower20SimplySS() {
        let wordPower20Position = app.tables.staticTexts["20 Position"]
        let wordPower20SimplySSElement = app.tables.staticTexts["WordPower20 Simply SS"]
        scrollToVocabularyElement(element: wordPower20Position)
        wordPower20Position.tap()
        scrollToVocabularyElement(element: wordPower20SimplySSElement)
        wordPower20SimplySSElement.tap()
    }
    
    // MultiChat English Vocabularies
    func selectMultiChat15AdultSS() {
        let multiChat15 = app.tables.staticTexts["MultiChat 15"]
        let multiChat15AdultSSElement = app.tables.staticTexts["MultiChat 15 Adult SS"]
        scrollToVocabularyElement(element: multiChat15)
        multiChat15.tap()
        scrollToVocabularyElement(element: multiChat15AdultSSElement)
        multiChat15AdultSSElement.tap()
    }
    
    func selectMultiChat15AdolescentSS() {
        let multiChat15 = app.tables.staticTexts["MultiChat 15"]
        let multiChat15AdolescentSSElement = app.tables.staticTexts["MultiChat 15 Adolescent SS"]
        scrollToVocabularyElement(element: multiChat15)
        multiChat15.tap()
        scrollToVocabularyElement(element: multiChat15AdolescentSSElement)
        multiChat15AdolescentSSElement.tap()
    }
    
    func selectMultiChat15StudentSS() {
        let multiChat15 = app.tables.staticTexts["MultiChat 15"]
        let multiChat15StudentSSElement = app.tables.staticTexts["MultiChat 15 Student SS"]
        scrollToVocabularyElement(element: multiChat15)
        multiChat15.tap()
        scrollToVocabularyElement(element: multiChat15StudentSSElement)
        multiChat15StudentSSElement.tap()
    }
    
    // Aphasia English Vocabularies
    func selectAphasiaUSSS() {
        let aphasiaElement = app.tables.staticTexts["Aphasia"]
        scrollToVocabularyElement(element: aphasiaElement)
        app.tables.staticTexts["Aphasia"].tap()
        app.tables.staticTexts["Aphasia US SS"].tap()
    }
    
    func selectAphasiaUKSS() {
        let aphasiaElement = app.tables.staticTexts["Aphasia"]
        scrollToVocabularyElement(element: aphasiaElement)
        app.tables.staticTexts["Aphasia"].tap()
        app.tables.staticTexts["Aphasia UK SS"].tap()
    }
    
    // QuickChat English Vocabularies
    func selectMyQuickChatChild4SS() {
        let myQuickChatChild = app.tables.staticTexts["Child"]
        scrollToVocabularyElement(element: myQuickChatChild)
        myQuickChatChild.tap()
        let myQuickChatChild4SS = app.tables.staticTexts["My QuickChat Child 4 SS"]
        scrollToVocabularyElement(element: myQuickChatChild4SS)
        myQuickChatChild4SS.tap()
    }
    
    func selectMyQuickChatChild8SS() {
        let myQuickChatChild = app.tables.staticTexts["Child"]
        scrollToVocabularyElement(element: myQuickChatChild)
        myQuickChatChild.tap()
        let myQuickChatChild8SS = app.tables.staticTexts["My QuickChat Child 8 SS"]
        scrollToVocabularyElement(element: myQuickChatChild8SS)
        myQuickChatChild8SS.tap()
    }
    
    func selectMyQuickChatChild12SS() {
        let myQuickChatChild = app.tables.staticTexts["Child"]
        scrollToVocabularyElement(element: myQuickChatChild)
        myQuickChatChild.tap()
        let myQuickChatChild12SS = app.tables.staticTexts["My QuickChat Child 12 SS"]
        scrollToVocabularyElement(element: myQuickChatChild12SS)
        myQuickChatChild12SS.tap()
    }
    
    func selectMyQuickChatAdult8SS() {
        let myQuickChatAdult = app.tables.staticTexts["Adult"]
        scrollToVocabularyElement(element: myQuickChatAdult)
        myQuickChatAdult.tap()
        let myQuickChatAdult8SS = app.tables.staticTexts["My QuickChat Adult 8 SS"]
        scrollToVocabularyElement(element: myQuickChatAdult8SS)
        myQuickChatAdult8SS.tap()        
    }
    
    func selectMyQuickChatAdult12SS() {
        let myQuickChatAdult = app.tables.staticTexts["Adult"]
        scrollToVocabularyElement(element: myQuickChatAdult)
        myQuickChatAdult.tap()
        let myQuickChatAdult12SS = app.tables.staticTexts["My QuickChat Adult 12 SS"]
        scrollToVocabularyElement(element: myQuickChatAdult12SS)
        myQuickChatAdult12SS.tap()        
    }
    
    func selectSintaxis4x4English() {
        let sintaxis4x4English = app.tables.staticTexts["sin sintaxis 4 x 4 English SS"]
        scrollToVocabularyElement(element: sintaxis4x4English)
        sintaxis4x4English.tap()
    }
    
    func selectSintaxis4x5English() {
        let sintaxis4x5English = app.tables.staticTexts["sintaxis 4 x 5 English SS"]
        scrollToVocabularyElement(element: sintaxis4x5English)
        sintaxis4x5English.tap()
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
