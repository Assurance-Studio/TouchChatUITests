//  TouchChatUITests
//
//  Created by Alin Voinescu on 07.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.


import XCTest

final class speechDisplayBarTests: XCTestCase {
    
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        let pages = Pages(app: app)
        
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        pages.checkLicenseModal()
        pages.checkStartModal()
        pages.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }
    
    func testSpeechDisplayBarTests() throws {
        let vocabularyName = "copied vocabulary speech display bar"
        let vocabylaryDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        let pages = Pages(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let speechDisplayBarPage = SpeechDisplayBarPage(app: app)
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocab: vocabularyName)
        
        //enable rename vocab option
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //check the hide speech display bar and check if it works
        speechDisplayBarPage.checkTheHideDisplayBar()
        
        //uncheck the allowCopyPaste switch
//        let allowCopyPaste = app.switches.element(boundBy: 10)
//        allowCopyPaste.tap()
//        app.buttons["Done"].tap()
//        
//        app.buttons["t"].tap()
//        app.buttons["e"].tap()
//        app.buttons["s"].tap()
//        app.buttons["t"].tap()
//        
//        let sdbTestWord = app.textFields["Test"]
//        sdbTestWord.press(forDuration: 2.0)
        
        //uncheck Auto Capitalization and check if it works
        speechDisplayBarPage.checkAutoCapitalization()
        
        pages.checkSdbText(sdbText: "test")
        
        profilesAndEditingPage.openTheSettingsTab()
        let autoCapitalization = app.switches.element(boundBy: 10)
        autoCapitalization.tap()
    
        //check show icons and check if it works
//        let showIcons = app.switches.element(boundBy: 12)
//        showIcons.tap()
//        
//        let imageSizeShowIcons = app.images.element(boundBy: 10)
//        let imageSizeShowIconsBefore = imageSizeShowIcons.frame.size
//        
//        let doneButton = app.buttons["Done"]
//        let doneButtonExists = doneButton.waitForExistence(timeout: 5)
//        XCTAssertTrue(doneButtonExists, "The done button is not visible")
//        doneButton.tap()
//        
//        let imageSizeShowIconsAfter = imageSizeShowIcons.frame.size
//        
//        XCTAssert(imageSizeShowIconsAfter.width < imageSizeShowIconsBefore.width, "The image size did not increase as expected")
        
        //hide delete button
        speechDisplayBarPage.checkHideDeleteButton()
        
        //check the fonts
        //ToDo: check if changing the font has a result
        speechDisplayBarPage.checkFontsType()
                
        //check the font size
        //toDo: check if changing the font suze has a result
        speechDisplayBarPage.checkFontSize()
        
        //check the font color
        speechDisplayBarPage.checkFontColor()
        
        //check the background color
        speechDisplayBarPage.checkBackgroundColor()
        
        //check the number of lines
        speechDisplayBarPage.checkNumberOfLines()
        
        //visible Cursor
        speechDisplayBarPage.checkTheCursor()
//        let textField = app.textFields["test"]
//        textField.tap()
//        let isFocused = textField.hasFocus
        
        //check the highlight Spoken Word options
        speechDisplayBarPage.checkTheHighlightSpoken()
        
        //check the highlight color phone/facetime
        speechDisplayBarPage.checkHighlightColorPhone()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Speech Display Bar Tests Test Finished with success!")
        
        app.terminate()
        
    }
}
