//  Pages.swift
//  TouchChatUITests
//
//  Created by Marius N on 06.06.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import Foundation
import XCTest

class Pages {
    
    let app: XCUIApplication
    let permissionScreen: XCUIElement
    let yesButton: XCUIElement
    let noButton: XCUIElement
    let backButton: XCUIElement
    var vocabName = "vocabulary"
    //Vocabs
    let SpanishVocab = XCUIApplication().tables.staticTexts["Spanish"]
    let sintaxis4x4English = XCUIApplication().tables.staticTexts["sin sintaxis 4 x 4 English SS"]
    let sintaxis4x4Spanish = XCUIApplication().tables.staticTexts["sin sintaxis 4 x 4 Spanish SS"]
    let sintaxis4x5English = XCUIApplication().tables.staticTexts["sintaxis 4 x 5 English SS"]
    let sintaxis4x5Spanish = XCUIApplication().tables.staticTexts["sintaxis 4 x 5 Spanish SS"]
    let afasiaEspanol = XCUIApplication().tables.staticTexts["Afasia Español SS"]
    let multiChat15Bilingual = XCUIApplication().tables.staticTexts["MultiChat 15 Spanish Bilingual SS"]
    let multiChat15Spanish  = XCUIApplication().tables.staticTexts["MultiChat15 Spanish SS"]
    let wordPowerVocab = XCUIApplication().tables.staticTexts["WordPower"]
    let wordPower25Position = XCUIApplication().tables.staticTexts["25 Position"]
    let wordPower25TouchScan = XCUIApplication().tables.staticTexts["WordPower25 Touch & Scan SS"]
    let wordPower42Position = XCUIApplication().tables.staticTexts["42 Position"]
    let wordPower42SS = XCUIApplication().tables.staticTexts["WordPower42 SS"]
    let wordPower48Position = XCUIApplication().tables.staticTexts["48 Position"]
    let wordPower48SS = XCUIApplication().tables.staticTexts["WordPower48 SS"]
    let wordPower60Position = XCUIApplication().tables.staticTexts["60 Position"]
    let wordPower60SS = XCUIApplication().tables.staticTexts["WordPower60 SS"]
    let wordPower80Position = XCUIApplication().tables.staticTexts["80 Position"]
    let wordPower80SS = XCUIApplication().tables.staticTexts["WordPower80 SS"]
    let wordPower108Position = XCUIApplication().tables.staticTexts["108 Position"]
    let wordPower108SS = XCUIApplication().tables.staticTexts["WordPower108 SS"]
    let wordPower60BasicSS = XCUIApplication().tables.staticTexts["WordPower60 Basic SS"]
    let wordPower42BasicSS = XCUIApplication().tables.staticTexts["WordPower42 Basic SS"]
    let wordPower20Position = XCUIApplication().tables.staticTexts["20 Position"]
    let wordPower20SimplySS = XCUIApplication().tables.staticTexts["WordPower20 Simply SS"]
    let wordPower140Position = XCUIApplication().tables.staticTexts["140 Position"]
    let wordPower140SS = XCUIApplication().tables.staticTexts["WordPower140 SS"]
    let wordPower108SSKeyboard = XCUIApplication().tables.staticTexts["WordPower108 with Keyboard SS"]
    let myQuickChatVocab = XCUIApplication().tables.staticTexts["My QuickChat"]
    let childQuickChatVocab = XCUIApplication().tables.staticTexts["Child"]
    let quickChatChild4SS = XCUIApplication().tables.staticTexts["My QuickChat Child 4 SS"]
    let quickChatChild8SS = XCUIApplication().tables.staticTexts["My QuickChat Child 8 SS"]
    let quickChatChild12SS = XCUIApplication().tables.staticTexts["My QuickChat Child 12 SS"]
    let adultQuickChatVocab = XCUIApplication().tables.staticTexts["Adult"]
    let quickChatAdult8SS = XCUIApplication().tables.staticTexts["My QuickChat Adult 8 SS"]
    let quickChatAdult12SS = XCUIApplication().tables.staticTexts["My QuickChat Adult 12 SS"]
    let multiChat15Vocab = XCUIApplication().tables.staticTexts["MultiChat 15"]
    let multiChatAdolescentSS = XCUIApplication().tables.staticTexts["MultiChat 15 Adolescent SS"]
    let multiChatAdultSS = XCUIApplication().tables.staticTexts["MultiChat 15 Adult SS"]
    let multiChatStudentSS = XCUIApplication().tables.staticTexts["MultiChat 15 Student SS"]
    let aphasiaVocab = XCUIApplication().tables.staticTexts["Aphasia"]
    let aphasiaSpanishSS = XCUIApplication().tables.staticTexts["Afasia Español SS"]
    let aphasiaUKSS = XCUIApplication().tables.staticTexts["Aphasia UK SS"]
    let aphasiaUSSS = XCUIApplication().tables.staticTexts["Aphasia US SS"]
    let basic4SS = XCUIApplication().tables.staticTexts["Simple 4-Basic SS"]
    let engageForiOS = XCUIApplication().tables.staticTexts["Engage for iOS SS"]
    let myCoreSS = XCUIApplication().tables.staticTexts["MyCore SS"]
    let spellingSS = XCUIApplication().tables.staticTexts["Spelling SS"]
    let vocabPCSS = XCUIApplication().tables.staticTexts["VocabPC SS"]
    let tecladoSS = XCUIApplication().tables.staticTexts["Teclado SS"]
    let vocabPCSpanishSS = XCUIApplication().tables.staticTexts["Vocab PC Spanish SS"]
    let wordPowerEspanol48 = XCUIApplication().tables.staticTexts["WordPower 48 Español SS"]
    let wordPowerEspanol25 = XCUIApplication().tables.staticTexts["WordPower25 Español SS"]
    let wordPowerBasico48 = XCUIApplication().tables.staticTexts["WordPower48 Español Básico SS"]
    let wordPowerBasico60 = XCUIApplication().tables.staticTexts["WordPower60 Español Básico SS"]
    let wordPowerLiteTech96 = XCUIApplication().tables.staticTexts["WordPower96 Español Lite-Tech SS"]
    let frenchVocab = XCUIApplication().tables.staticTexts["French"]
    let base4FrenchSS = XCUIApplication().tables.staticTexts["4 de base français SS"]
    let communicationFrancaisSS = XCUIApplication().tables.staticTexts["Communication Journey Aphasie français SS"]
    let multiChat15FrancaisSS = XCUIApplication().tables.staticTexts["MultiChat15 français SS"]
    let vocabPCFrancaisSS = XCUIApplication().tables.staticTexts["VocabPC français SS"]
    let epelerFrancaisSS = XCUIApplication().tables.staticTexts["Épeler français SS"]
    let wordPower120Azerty = XCUIApplication().tables.staticTexts["WordPower120 français AZERTY SS"]
    let wordPower120FrancaisSS = XCUIApplication().tables.staticTexts["WordPower120 français SS"]
    let wordPower60FrancaisSS = XCUIApplication().tables.staticTexts["WordPower60 français SS"]
    
    lazy var mainPage: MainPage = {
        return MainPage(app: XCUIApplication(), vocabName: vocabName)
    }()
    let vocabPage = VocabPage(app: XCUIApplication(), vocabName: "vocab")
    
    init(app: XCUIApplication) {
        self.app = app
        permissionScreen = app.buttons["Allow"]
        yesButton = app.buttons["Yes"]
        noButton = app.buttons["Yes"]
        backButton = app.buttons["Back"]
    }
    
    func clickWelcomeX() {
        sleep(5)
        let welcomeModal = app.staticTexts["Welcome"]
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let centerScreenCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: 0.3, dy: 0.3))
        // Adjust this based on the actual element type

                if welcomeModal.exists {
                    centerScreenCoordinate.tap()
                        sleep(1) // Adds a second pause
                }
        }
    
    func checkStartModal(){
        let startModal = app.staticTexts["Select your language and voice"]
        if startModal.exists{
            app.buttons["Continue"].tap()
            sleep(1)
        }
    }
    
    func checkLicenseModal(){
        let licenseAgreement = app.staticTexts["License Agreement"]
        let continueBtn = app.buttons["Continue"]
        
        if licenseAgreement.exists{
            app.switches.element(boundBy: 0).tap()
            continueBtn.tap()
        }
    }
    
    func openAVocab(){
        let openAVocabModal = app.staticTexts["What would you like to do with this vocabulary?"]
        XCTAssertTrue(openAVocabModal.exists, "The open vocab modal is not visible.")
        app.buttons["Open"].tap()
    }
    
    func clearAppCache() {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
    }
    
    //new functions
    func backToVocab(){
        let vocabButton = app.navigationBars.buttons["Vocab"]
        let vocabButtonExists = vocabButton.waitForExistence(timeout: 5)
        vocabButton.tap()
        app.popovers.scrollViews.otherElements.buttons["Choose New Vocab"].tap()
        let editButtonPage = app.buttons["Edit"]
        let editButtonExists = editButtonPage.waitForExistence(timeout: 5)
        
        //        XCUIApplication().tables.staticTexts["MyCore SS  "].tap()
    }
    
    func editPage() {
        sleep(5)
        app.navigationBars.buttons["Menu"].tap()
        app.buttons["Edit Page"].tap()
        sleep(2)
    }
    
    func addNewGesture() {
        app.navigationBars.buttons["Menu"].tap()
        app.buttons["Edit Gestures"].tap()
        let addGestureButton = app.buttons["Add"]
        let addGestureButtonExists = addGestureButton.waitForExistence(timeout: 5)
        XCTAssertTrue(addGestureButtonExists, "The Add button is visible")
        addGestureButton.tap()
        
        let firstTextField = app.textFields.element(boundBy: 0)
        firstTextField.tap()
        firstTextField.typeText("Gesture by e2e")
        
        let popoversQuery = app.popovers
        popoversQuery.scrollViews.otherElements.buttons["Add"].tap()
        
        let tablesQuery = popoversQuery.tables
        
        tablesQuery.staticTexts["Clear Display"].swipeUp()
        sleep(2)
        tablesQuery.staticTexts["Help Signal"].swipeUp()
        sleep(2)
        tablesQuery.staticTexts["Navigate To Home"].swipeUp()
        sleep(2)
        tablesQuery.staticTexts["Speak"].swipeUp()
        sleep(3)
        let speechMessageOption = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Speech Message"]/*[[".cells.staticTexts[\"Speech Message\"]",".staticTexts[\"Speech Message\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let speechMessageOptionExists = speechMessageOption.waitForExistence(timeout: 5)
        XCTAssertTrue(speechMessageOptionExists, "The Speech Message option is not visible.")
        speechMessageOption.tap()
        
        app.buttons["Save"].tap()
        sleep(3)
        app.popovers.navigationBars["Select Gesture"].buttons["Done"].tap()
        sleep(3)
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addPageLayout() {
        sleep(5)
        app.navigationBars.buttons["Menu"].tap()
        app.buttons["Edit Page Layout"].tap()
    }
    
    func changeThePageName(){
        let textFieldLayout = app.textFields["SPKBD-QWERTY"]
        textFieldLayout.tap()
        textFieldLayout.doubleTap()
        textFieldLayout.typeText("Test")
        app.textFields["SPKBD-Test"].doubleTap()
        app.textFields["SPKBD-Test"].typeText("Test by e2e")
    }
    
    func changeRowsAndColumns(){
        let popoversQuery = app.popovers
        let elementsQuery = popoversQuery.scrollViews.otherElements
        elementsQuery.buttons["10 Rows"].tap()
        
        let tablesQuery = popoversQuery.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["15 Rows"]/*[[".cells.staticTexts[\"15 Rows\"]",".staticTexts[\"15 Rows\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["10 Columns"]/*[[".buttons[\"10 Columns\"].staticTexts[\"10 Columns\"]",".staticTexts[\"10 Columns\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["15 Columns"]/*[[".cells.staticTexts[\"15 Columns\"]",".staticTexts[\"15 Columns\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func selectImageLayout() {
        let popoversQuery = app.popovers
        let elementsQuery = popoversQuery.scrollViews.otherElements
        
        let tablesQuery = popoversQuery.tables
        elementsQuery.buttons["Black"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Red"]/*[[".cells.staticTexts[\"Red\"]",".staticTexts[\"Red\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        elementsQuery.buttons["Select Image"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["PRC Symbols"]/*[[".cells.staticTexts[\"PRC Symbols\"]",".staticTexts[\"PRC Symbols\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Numbers & Symbols"]/*[[".cells.staticTexts[\"Numbers & Symbols\"]",".staticTexts[\"Numbers & Symbols\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.cells.containing(.staticText, identifier:"123").staticTexts["Source: PRC Symbols"].tap()
        
        let saveButton = popoversQuery.navigationBars["Edit Page"].buttons["Save"]
        saveButton.tap()
    }
    
    func clearImageLayout(){
        let popoversQuery = app.popovers
        let elementsQuery = popoversQuery.scrollViews.otherElements
        
        let tablesQuery = popoversQuery.tables
        let testByE2eNavigationBar = app.navigationBars["Test by e2e"]
        testByE2eNavigationBar.buttons["Menu"].tap()
        elementsQuery.buttons["Edit Page Layout"].tap()
        elementsQuery.buttons["Clear Image"].tap()
        let saveButton = popoversQuery.navigationBars["Edit Page"].buttons["Save"]
        saveButton.tap()
        testByE2eNavigationBar.buttons["Done"].tap()
    }
    
    func verifyGestureExists() {
        let scrollViewToolbar = app.buttons["t"]
        XCTAssertTrue(scrollViewToolbar.exists, "Toolbar doesn't exist.")
        
        let elementPosition = scrollViewToolbar.frame.origin
        let elementSize = scrollViewToolbar.frame.size
        let centerX = elementPosition.x + elementSize.width / 2
        let centerY = elementPosition.y + elementSize.height / 2
        
        let startCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: centerX / UIScreen.main.bounds.width, dy: centerY / UIScreen.main.bounds.height))
        let endCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: centerX / UIScreen.main.bounds.width, dy: (centerY - 100) / UIScreen.main.bounds.height))
        
        startCoordinate.press(forDuration: 0.1, thenDragTo: endCoordinate)
        
        let sdbElement = app.textFields["Gesture by e2e "]
        XCTAssertTrue(sdbElement.exists, "Searched text not found")
    }
    
    func checkSdbText(sdbText: String){
        let sdbElement = app.textFields[sdbText]
        XCTAssertTrue(sdbElement.exists, "Searched text not found")
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
    
    func reachAddAbbreviation(){
        app.navigationBars.buttons["Menu"].tap()
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        elementsQuery.buttons["Edit Abbreviations"].tap()
        let abbreviationsNavigationBar = popoversQuery.navigationBars["Abbreviations"]
        let existsAbbreviationNavigationBar = abbreviationsNavigationBar.waitForExistence(timeout: 5)
        abbreviationsNavigationBar.buttons["Add"].tap()
    }
    
    func addAbbreviation(){
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let abbreviationsNavigationBar = popoversQuery.navigationBars["Abbreviations"]
        let abbreviationElementsQuery = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Abbreviation")
        abbreviationElementsQuery.children(matching: .textField).element(boundBy: 0).tap()
        abbreviationElementsQuery.children(matching: .textField).element(boundBy: 0).typeText("test")
        
        let clearTextTextField = elementsQuery.textFields.containing(.button, identifier:"Clear text").element
        clearTextTextField.tap()
        abbreviationElementsQuery.children(matching: .textField).element(boundBy: 1).tap()
        abbreviationElementsQuery.children(matching: .textField).element(boundBy: 1).typeText("Test by e2e")
        abbreviationsNavigationBar.buttons["Save"].tap()
        abbreviationsNavigationBar.buttons["Done"].tap()
    }
    
    func checkAddAbbreviation(){
        app.buttons["t"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["e"]/*[[".buttons[\"e\"].staticTexts[\"e\"]",".staticTexts[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["s"].tap()
        app.buttons["t"].tap()
        app.buttons["."].tap()
        app.buttons["t"].tap()
        app.buttons["BackButton"].tap()
    }
    
    func writeTestBy(){
        let tbutton = app.buttons["t"]
        let waitForTButton = tbutton.waitForExistence(timeout: 5)
        app.buttons["t"].tap()
        app.buttons["e"].tap()
        app.buttons["s"].tap()
        app.buttons["t"].tap()
        app.buttons["b"].tap()
        app.buttons["y"].tap()
    }
    
    func reachToEditAbbreviation(){
        app.navigationBars.buttons["Menu"].tap()
        let popoversQuery = app.popovers
        popoversQuery.scrollViews.otherElements.buttons["Edit Abbreviations"].tap()
        let editAbbreviationPage = popoversQuery.toolbars["Toolbar"].buttons["Edit"]
        let waitForTheEditAbbreviation = editAbbreviationPage.waitForExistence(timeout: 5)
        editAbbreviationPage.tap()
    }
    
    func removeTheAbbreviation(){
        app.buttons["Remove test., Test by e2e"].tap()
        app.buttons["Delete"].tap()
        
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let abbreviationsNavigationBar = popoversQuery.navigationBars["Abbreviations"]
        abbreviationsNavigationBar.buttons["Done"].tap()
    }
    
    func clearAllAbbreviations(){
        app.popovers.toolbars["Toolbar"].buttons["Clear"].tap()
        XCTAssertTrue(app.staticTexts["Are you sure you want to erase all?"].exists, "The clear modal doesn't appear")
        app.alerts["Clear"].scrollViews.otherElements.buttons["Yes"].tap()
    }
    
    func clearAllPronunciations(){
        app.buttons["Clear"].tap()
        XCTAssertTrue(app.staticTexts["Are you sure you want to erase all?"].exists, "The clear modal doesn't appear")
        app.buttons["Yes"].tap()
    }
    
    func reachEditPronunciations(){
        app.navigationBars.buttons["Menu"].tap()
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        elementsQuery.buttons["Edit Pronunciations"].tap()
        let pronunciationsNavigationBar = popoversQuery.navigationBars["Pronunciations"]
        let existsPronunciationsNavigationBar = pronunciationsNavigationBar.waitForExistence(timeout: 5)
        pronunciationsNavigationBar.buttons["Add"].tap()
    }
    
    func restoreToDefaultsAbbreviation(){
        let popoversQuery = app.popovers
        popoversQuery.toolbars["Toolbar"].buttons["Restore Defaults"].tap()
        XCTAssertTrue(app.staticTexts["Are you sure you want to restore all default values?"].exists, "The restore modal doesn't appear")
        app.alerts["Restore Defaults"].scrollViews.otherElements.buttons["Yes"].tap()
        popoversQuery.navigationBars["Abbreviations"].buttons["Done"].tap()
    }
    
    func addPronunciations(){
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let pronunciationsNavigationBar = popoversQuery.navigationBars["Pronunciations"]
        app.textFields.element(boundBy: 2).tap()
        app.textFields.element(boundBy: 2).typeText("test")
        app.textFields.element(boundBy: 3).tap()
        app.textFields.element(boundBy: 3).typeText("Test by e2e")
        pronunciationsNavigationBar.buttons["Save"].tap()
    }
    
    func scrollForSearchPronunciations(){
        let scrollViewToolbar = app.staticTexts["⛄"]
        XCTAssertTrue(scrollViewToolbar.exists, "Toolbar doesn't exist.")
        
        let elementPosition = scrollViewToolbar.frame.origin
        let elementSize = scrollViewToolbar.frame.size
        let centerX = elementPosition.x + elementSize.width / 2
        let centerY = elementPosition.y + elementSize.height / 2
        
        let startCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: centerX / UIScreen.main.bounds.width, dy: centerY / UIScreen.main.bounds.height))
        let endCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: centerX / UIScreen.main.bounds.width, dy: (centerY + 100) / UIScreen.main.bounds.height))
        
        startCoordinate.press(forDuration: 0.1, thenDragTo: endCoordinate)
    }
    
    func searchPronunciations(){
        app.searchFields["Search"].tap()
        app.searchFields["Search"].typeText("test")
    }
    
    func deletePronunciations(){
        let popoversQuery = XCUIApplication().popovers
        let toolbar = popoversQuery.toolbars["Toolbar"]
        toolbar.buttons["Edit"].tap()
        
        let tablesQuery = popoversQuery.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Remove test, Test by e2e"]/*[[".cells.buttons[\"Remove test, Test by e2e\"]",".buttons[\"Remove test, Test by e2e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        toolbar.buttons["Done"].tap()
        popoversQuery.navigationBars["Pronunciations"].buttons["Cancel"].tap()
    }
    
    func checkTheiOSGallery(){
        sleep(2)
        let elementsQuery = XCUIApplication().popovers.scrollViews.otherElements
        elementsQuery.buttons["Import Photo"].tap()
        let photosBtn = app.staticTexts["Photos"]
        let photosBtnExists = photosBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(photosBtnExists, "The ios gallery is not opening")
        let centerScreenCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: 0.1, dy: 0.2))
        centerScreenCoordinate.tap()
        sleep(3)
    }
    
    func restoreToDefaultsPronunciations(){
        app.buttons["Restore Defaults"].tap()
        XCTAssertTrue(app.staticTexts["Are you sure you want to restore all default values?"].exists, "The Restore Defaults modal doesn't appear")
        app.buttons["Yes"].tap()
        app.buttons["Done"].tap()
    }
    
    func openStoreTextBtn(){
        app.navigationBars.buttons["Menu"].tap()
        app.popovers.scrollViews.otherElements.buttons["Store Text to Button"].tap()
        XCTAssertTrue(app.staticTexts["Select the button where you want to store your composed message"].exists, "The Store Text modal doesn't appear")
        app.alerts["Store Text to Button?"].scrollViews.otherElements.buttons["Continue"].tap()
    }
    
    func checkIfTheStoreButtonWorks(){
        app.buttons["SPACE"].tap()
        XCTAssertTrue(app.buttons["Testby"].exists, "The StoreTextButton is not visible")
        app.buttons["Testby"].tap()
    }
    
    func vocabDesc(){
        let vocabularyName = "copied vocabulary"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
    }
    
    func addNewPage(){
        app.navigationBars.buttons["Menu"].tap()
        let addNewPage = app.buttons["Add New Page"]
        let addNewPageExists = addNewPage.waitForExistence(timeout: 5)
        XCTAssertTrue(addNewPageExists, "The Add New Page button is not visible")
        addNewPage.tap()
    }
    
    func addNewBlankPage(){
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let newBlankPage = elementsQuery.buttons["New Blank Page"]
        let existsNewBlankPage = newBlankPage.waitForExistence(timeout: 5)
        
        newBlankPage.tap()
    }
    
    func addNewTemplatePage(){
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let newPageTemplate = elementsQuery.buttons["New Page from Template"]
        let existsNewTemplatePage = newPageTemplate.waitForExistence(timeout: 5)
        
        newPageTemplate.tap()
    }
    
    func setANameForTemplatePage(){
        app.textFields.element(boundBy: 0).tap()
        app.textFields.element(boundBy: 0).typeText("Test by e2e Template")
        app.popovers.navigationBars["New Page Name"].buttons["Save"].tap()
        app.navigationBars["Test by e2e Template"].buttons["Done"].tap()
    }
    
    func addRowsColumnsBlankPage(){
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        
        let pageNameElementsQuery = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Page Name")
        sleep(3)
        app.textFields.element(boundBy: 0).tap()
        app.textFields.element(boundBy: 0).typeText("Page by e2e")
        
        elementsQuery.buttons["10 Rows"].tap()
        
        let tablesQuery = popoversQuery.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["15 Rows"]/*[[".cells.staticTexts[\"15 Rows\"]",".staticTexts[\"15 Rows\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        elementsQuery.buttons["10 Columns"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["17 Columns"]/*[[".cells.staticTexts[\"17 Columns\"]",".staticTexts[\"17 Columns\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func addBackgroundColorAndImage(){
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let pageNameElementsQuery = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Page Name")
        
        let tablesQuery = popoversQuery.tables
        
        pageNameElementsQuery.children(matching: .button).element(boundBy: 3).tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Orange"]/*[[".cells.staticTexts[\"Orange\"]",".staticTexts[\"Orange\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        elementsQuery.buttons["Select Image"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["PRC Symbols"]/*[[".cells.staticTexts[\"PRC Symbols\"]",".staticTexts[\"PRC Symbols\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["C"]/*[[".cells.staticTexts[\"C\"]",".staticTexts[\"C\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.cells.containing(.staticText, identifier:"C").staticTexts["Source: PRC Symbols"].tap()
        //        popoversQuery.navigationBars["New Page"].buttons["Save"].tap()
    }
    
    func clearImageNewPage(){
        let popoversQuery = app.popovers
        
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Clear Image"].tap()
        popoversQuery.navigationBars["New Page"].buttons["Save"].tap()
    }
    
    func deleteThePage(){
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let pageNameElementsQuery = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Page Name")
        
        let testNavigationBar = app.navigationBars["Page by e2e"]
        testNavigationBar.buttons["Menu"].tap()
        elementsQuery.buttons["Delete This Page"].tap()
        XCTAssertTrue(app.staticTexts["Confirm Page Deletion"].exists, "The deletion modal doesn't appear")
        app.buttons["Okay"].tap()
        
        XCUIApplication().navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func addHomePageType(){
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.scrollViews.otherElements.buttons["Normal Page"].tap()
        popoversQuery.tables.cells.containing(.staticText, identifier:"Home Page").children(matching: .other).element(boundBy: 1).tap()
        popoversQuery.navigationBars["Page Type"].buttons["Done"].tap()
    }
    
    func addTemplatePage(){
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.scrollViews.otherElements/*@START_MENU_TOKEN@*/.staticTexts["Normal Page"]/*[[".buttons[\"Normal Page\"].staticTexts[\"Normal Page\"]",".staticTexts[\"Normal Page\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        popoversQuery.tables.cells.containing(.staticText, identifier:"Template").children(matching: .other).element(boundBy: 0).tap()
        popoversQuery.navigationBars["Page Type"].buttons["Done"].tap()
    }
    
    func hideAButton(){
        app.navigationBars.buttons["Menu"].tap()
        
        let elementsQuery = app.popovers.scrollViews.otherElements
        elementsQuery.buttons["Hide Mode"].tap()
        
        app.buttons["z"].tap()
        XCUIApplication().navigationBars["* Hide Mode *"].buttons["Done"].tap()
        XCTAssertFalse(app.buttons["z"].exists, "The element should no exist")
    }
    
    func hideAllButtons(){
        app.navigationBars.buttons["Menu"].tap()
        
        let elementsQuery = app.popovers.scrollViews.otherElements
        elementsQuery.buttons["Edit Page"].tap()
        sleep(2)
        app.navigationBars["SPKBD-QWERTY"].buttons["Menu"].tap()
        elementsQuery.buttons["Hide Mode"].tap()
        
        let hideModeNavigationBar = app.navigationBars["* Hide Mode *"]
        hideModeNavigationBar.buttons["Menu"].tap()
        elementsQuery.buttons["* Hide All *"].tap()
        hideModeNavigationBar.buttons["Done"].tap()
        
        let button1 = app.buttons["TEXTING"]
        let button2 = app.buttons["PHRASES"]
        let button3 = app.buttons["SHIFT"]
        let button4 = app.buttons["SPACE"]
        let button5 = app.buttons["CLEAR "]
        
        let buttonsDoNotExists = !button1.exists && !button2.exists && !button3.exists && !button4.exists && !button5.exists
        
        XCTAssertTrue(buttonsDoNotExists, "One or more specified buttons exist when they should not")
    }
    
    func showAllButtons(){
        app.navigationBars.buttons["Menu"].tap()
        
        let elementsQuery = app.popovers.scrollViews.otherElements
        elementsQuery.buttons["Edit Page"].tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Menu"].tap()
        elementsQuery.buttons["Hide Mode"].tap()
        
        let hideModeNavigationBar = app.navigationBars["* Hide Mode *"]
        hideModeNavigationBar.buttons["Menu"].tap()
        elementsQuery.buttons["* Show All *"].tap()
        hideModeNavigationBar.buttons["Done"].tap()
        
        let button1 = app.buttons["TEXTING"]
        let button2 = app.buttons["PHRASES"]
        let button3 = app.buttons["SHIFT"]
        let button4 = app.buttons["SPACE"]
        let button5 = app.buttons["CLEAR "]
        
        let buttonVocabExists = button1.exists && button2.exists && button3.exists && button4.exists && button5.exists
        
        XCTAssertTrue(buttonVocabExists, "One or more specified buttons don't exist")
    }
    
    func normalModeButtons(){
        app.navigationBars.buttons["Menu"].tap()
        
        let elementsQuery = app.popovers.scrollViews.otherElements
        elementsQuery.buttons["Edit Page"].tap()
        sleep(3)
        
        let spkbdQwertyNavigationBar = app.navigationBars["SPKBD-QWERTY"]
        spkbdQwertyNavigationBar.buttons["Menu"].tap()
        elementsQuery.buttons["Hide Mode"].tap()
        app.navigationBars["* Hide Mode *"].buttons["Menu"].tap()
        elementsQuery.buttons["* Normal Mode *"].tap()
        app.buttons["d"].tap()
        
        XCTAssertTrue(app.buttons["Edit This Button"].exists, "The button doesn't exist")
        
        app/*@START_MENU_TOKEN@*/.otherElements["PopoverDismissRegion"]/*[[".otherElements[\"dismiss popup\"]",".otherElements[\"PopoverDismissRegion\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        spkbdQwertyNavigationBar.buttons["Done"].tap()
    }
    
    func openPageStyleOverride(){
        sleep(3)
        app.navigationBars["SPKBD-QWERTY"].buttons["Menu"].tap()
        app.popovers.scrollViews.otherElements.buttons["Page Style Override"].tap()
    }
    
    func checkTheToggleandSwitchIt(){
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
    
    func chooseAColorandChecktheOptions(){
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Black"].tap()
        
        let blackColor = app.staticTexts["Black"]
        let limeColor = app.staticTexts["Lime"]
        let seaGreenColor = app.staticTexts["Sea green"]
        let whiteColor = app.staticTexts["White"]
        let lavenderColor = app.staticTexts["Lavender"]
        
        let colorsExists = blackColor.exists && limeColor.exists && seaGreenColor.exists && whiteColor.exists && lavenderColor.exists
        
        XCTAssertTrue(colorsExists, "One or more specified colors don't exist")
        
        
        let app = XCUIApplication()
        let popoversQuery = app.popovers
        popoversQuery.tables/*@START_MENU_TOKEN@*/.staticTexts["Orange"]/*[[".cells.staticTexts[\"Orange\"]",".staticTexts[\"Orange\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        popoversQuery.navigationBars["Vocab Override"].buttons["Save"].tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func editThisButton(){
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
    
    func selectImageButton(){
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.scrollViews.otherElements.buttons["Select Image"].tap()
        sleep(4)
        
        let tablesQuery = popoversQuery.tables
        app.staticTexts["PRC Symbols"].tap()
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["E"]/*[[".cells.staticTexts[\"E\"]",".staticTexts[\"E\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Edge").staticTexts["Source: PRC Symbols"].tap()
    }
    
    func checkSwitchesEditButton(){
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
    
    func checkTheFontOptions(fontName: String){
        XCUIApplication().popovers.scrollViews.otherElements.buttons[fontName].tap()
        
        let font1 = app.staticTexts["Amaranth"]
        let font2 = app.staticTexts["Caudex"]
        let font3 = app.staticTexts["Gentium Basic"]
        let font4 = app.staticTexts["Istok Web"]
        let font5 = app.staticTexts["Josefin Sans"]
        let font6 = app.staticTexts["Puritan"]
        let font7 = app.staticTexts["Ubuntu"]
        let font8 = app.staticTexts["Arial"]
        let font9 = app.staticTexts["Courier New"]
        let font10 = app.staticTexts["Georgia"]
        let font11 = app.staticTexts["Times New Roman"]
        let font12 = app.staticTexts["Trebuchet MS"]
        let font13 = app.staticTexts["Verdana"]
        
        let fontsExist = font1.exists && font2.exists && font3.exists && font4.exists && font5.exists && font6.exists && font7.exists && font8.exists && font9.exists && font10.exists && font11.exists && font12.exists && font13.exists
        
        XCTAssertTrue(fontsExist, "One or more specified fonts don't exist")
    }
    
    func checkPointOptions(pointField: String){
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
        popoversQuery.scrollViews.otherElements.buttons[pointField].tap()
        app.staticTexts["7 Point"].tap()
        
        let checkFontSize = app.staticTexts["7 Point"].waitForExistence(timeout: 5)
        XCTAssertTrue(checkFontSize, "The Font Size is not correct")
        
//        let scrollViewsQuery = XCUIApplication().popovers.scrollViews
//        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Button Label").element.swipeUp()
//        scrollViewsQuery.otherElements.staticTexts["Bold Text"].swipeUp()
//        scrollViewsQuery.otherElements.staticTexts["Visible"].swipeUp()
    }
    
    func checkTextColorOptions(){
        let popoversQuery = XCUIApplication().popovers
        XCUIApplication().popovers.scrollViews.otherElements.containing(.staticText, identifier:"Button Label").children(matching: .button).matching(identifier: "Black").element(boundBy: 0).tap()
        
        let redTextColor = app.staticTexts["Red"]
        let brownTextColor = app.staticTexts["Brown"]
        let limeTextColor = app.staticTexts["Lime"]
        let skyBlueTextColor = app.staticTexts["Skyblue"]
        let lavenderTextColor = app.staticTexts["Lavender"]
        
        let existsTextColor = redTextColor.exists && brownTextColor.exists && limeTextColor.exists && skyBlueTextColor.exists && lavenderTextColor.exists
        
        XCTAssertTrue(existsTextColor, "One or more specified text colors don't exist")
        
        popoversQuery.navigationBars["Select Color"].buttons["Cancel"].tap()
    }
    
    func checkBodyColorOptions(bodyColor: String){
        let popoversQuery = XCUIApplication().popovers
        
        popoversQuery.scrollViews.otherElements.buttons[bodyColor].tap()
        let redBodyColor = app.staticTexts["Red"]
        let brownBodyColor = app.staticTexts["Brown"]
        let limeBodyColor = app.staticTexts["Lime"]
        let skyBlueBodyColor = app.staticTexts["Skyblue"]
        let lavenderBodyColor = app.staticTexts["Lavender"]
        
        let existsBodyColor = redBodyColor.exists && brownBodyColor.exists && limeBodyColor.exists && skyBlueBodyColor.exists && lavenderBodyColor.exists
        
        XCTAssertTrue(existsBodyColor, "One or more specified body colors don't exist")
        
        popoversQuery.navigationBars["Select Color"].buttons["Cancel"].tap()
    }
    
    func checkBorderColorOptions(){
        XCUIApplication().popovers.scrollViews.otherElements.containing(.staticText, identifier:"Button Label").children(matching: .button).matching(identifier: "Black").element(boundBy: 1).tap()
        
        let redBorderColor = app.staticTexts["Red"]
        let brownBorderColor = app.staticTexts["Brown"]
        let limeBorderColor = app.staticTexts["Lime"]
        let skyBlueBorderColor = app.staticTexts["Skyblue"]
        let lavenderBorderColor = app.staticTexts["Lavender"]
        
        let existsBorderColor = redBorderColor.exists && brownBorderColor.exists && limeBorderColor.exists && skyBlueBorderColor.exists && lavenderBorderColor.exists
        
        XCTAssertTrue(existsBorderColor, "One or more specified border colors don't exist")
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.navigationBars["Select Color"].buttons["Cancel"].tap()
    }
    
    func checkBorderWidthOptions(borderPoint: String){
        XCUIApplication().popovers.scrollViews.otherElements.buttons[borderPoint].tap()
        
        let onePointWidth = app.staticTexts["1 Point"]
        let fifteenthPointWidth = app.staticTexts["15 Point"]
        let twentyPointWidth = app.staticTexts["20 Point"]
        
        let existsPointWidth = onePointWidth.exists && fifteenthPointWidth.exists && twentyPointWidth.exists
        
        XCTAssertTrue(existsPointWidth, "One or more specified points don't exist")
        twentyPointWidth.tap()
    }
    
    func addActionButton(buttonName: String){
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.scrollViews.otherElements.buttons["Add"].tap()
        popoversQuery.tables/*@START_MENU_TOKEN@*/.staticTexts["Add Message to Display"]/*[[".cells.staticTexts[\"Add Message to Display\"]",".staticTexts[\"Add Message to Display\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        popoversQuery.navigationBars["Edit Button"].buttons["Save"].tap()
        app.buttons["Done"].tap()
        
        let editButton = app.buttons[buttonName]
        XCTAssertTrue(editButton.exists, "The edit button is not visible")
        
        editButton.tap()
    }
    
    func changeButtonSize(buttonName: String){
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
    
    func removeTheButton(buttonName: String){
        app.buttons[buttonName].tap()
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Remove Button From Page"].tap()
        XCTAssertTrue(app.staticTexts["Confirm Button Deletion"].exists, "The delete modal doesn't appear")
        app.buttons["Okay"].tap()
        app.buttons["Done"].tap()
    }
    
    func copyAButton(buttonName: String){
        app.buttons[buttonName].tap()
        
        let app = XCUIApplication()
        app.popovers.scrollViews.otherElements.buttons["Copy Button"].tap()
    }
    
    func pasteTheButton(){
        app.buttons.element(boundBy: 14).tap()
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Paste Button"].tap()
        app.navigationBars["Main"].buttons["Done"].tap()
        app.buttons.element(boundBy: 14).tap()
        app.buttons["drink"].tap()
    }
    
    func useTheSameButton(){
        app.buttons.element(boundBy: 13).tap()
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Use Same Button"].tap()
        app.buttons.element(boundBy: 12).tap()
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Use Same Button"].tap()
        
        app.navigationBars["Main"].buttons["Done"].tap()
        app.buttons.element(boundBy: 13).tap()
        app.buttons["snack"].tap()
    }
    
    func createANewButton(){
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
    
    func createButtonForActions(button: Int, nameButton:String){
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
    
    func removeAnExistingButton(){
        app.buttons.element(boundBy: 12).tap()
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Remove Button From Page"].tap()
        XCTAssertTrue(app.staticTexts["Confirm Button Deletion"].exists, "The delete modal doesn't appear")
        app.buttons["Okay"].tap()
    }
    
    func removeAButton(button: Int){
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
    
    func renameACopiedVocab(){
        app.navigationBars.buttons["Edit"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.images["minus.circle.fill"]/*[[".cells",".buttons[\"Remove copied vocabulary edit\/rename  Modified 23 September 2024 at 13:49, vocabulary description e2e, ✓\"]",".images[\"remove\"]",".images[\"minus.circle.fill\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Rename"]/*[[".cells.buttons[\"Rename\"]",".buttons[\"Rename\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields.element(boundBy: 0).tap()
        XCUIApplication().popovers.scrollViews.otherElements/*@START_MENU_TOKEN@*/.buttons["Clear text"]/*[[".textFields.buttons[\"Clear text\"]",".buttons[\"Clear text\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields.element(boundBy: 0).typeText("Renamed by e2e")
        app.textViews.element(boundBy: 0).tap()
        app.textViews.element(boundBy: 0).doubleTap()
        app.textViews.element(boundBy: 0).typeText("Renamed")
        sleep(3)
        app.buttons["Save"].tap()
        app.buttons["Done"].tap()
    }
    
    func editAButtonForButtonStyle(){
        app.switches.element(boundBy: 0).tap()
        app.switches.element(boundBy: 1).tap()
        //turn on italics switch
        app.switches.element(boundBy: 2).tap()
        
        //select the font options
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Ubuntu"].tap()
        app.staticTexts["Verdana"].tap()
        
        //check the point options
        let popoversQuery = XCUIApplication().popovers
        popoversQuery.scrollViews.otherElements.buttons["12 Point"].tap()
        app.staticTexts["27 Point"].tap()
         
        //check the text color options
        XCUIApplication().popovers.scrollViews.otherElements.containing(.staticText, identifier:"Button Label").children(matching: .button).matching(identifier: "Black").element(boundBy: 0).tap()
        app.staticTexts["Green"].tap()
        app.buttons["Save"].tap()
    }
    
    func copyPasteButtonStyle(){
        //copy the button
        app.buttons.element(boundBy: 12).tap()
        app.buttons["Copy Button"].tap()
        
        //paste the button style
        app.buttons.element(boundBy: 11).tap()
        app.buttons["Paste Button Style"].tap()
    }
    
    func checkIfTheButtonStyleWasCopied(){
        app.buttons.element(boundBy: 11).tap()
        app.buttons["Edit This Button"].tap()
        
        let labelOnTopToggle = app.switches.element(boundBy: 0)
        let labelOnTopValue = labelOnTopToggle.value as! String
        
        if labelOnTopValue == "1"{
            print("Label on Top Toggle is ON")
        } else{
            print("Label on Top Toggle is OFF")
        }
        XCTAssertEqual(labelOnTopValue, "0", "The label on top toggle should be off")
        
        let boldTextToggle = app.switches.element(boundBy: 1)
        let boldTextValue = boldTextToggle.value as! String
        
        if boldTextValue == "1"{
            print("Bold Text Toggle is ON")
        } else{
            print("Bold Text Toggle is OFF")
        }
        XCTAssertEqual(boldTextValue, "0", "The bold text toggle should be off")
        //check the Body color options
        XCTAssertTrue(app.buttons["Verdana"].exists, "The font color is different")
        XCTAssertTrue(app.buttons["27 Point"].exists, "The font size is different")
        XCTAssertTrue(app.buttons["Green"].exists, "The text color is different")
        app.buttons["Save"].tap()
        XCUIApplication().navigationBars["Main"].buttons["Done"].tap()
    }
    
    func openDifferentLanguagePage(languageVocab: String){
        app.buttons["Menu"].tap()
        app.buttons["Language & Region"].tap()
        sleep(2)
        XCUIApplication().popovers.navigationBars["Language & Region"].buttons["Add"].tap()
        
        //French (Canada)
        app.staticTexts[languageVocab].tap()
        app.buttons["Done"].tap()
    }
    
    func resetPersistentStorage() {
        // Reset Core Data
        //        if let persistentStoreCoordinator = (UIApplication.shared.delegate as? AppDelegate)?.persistentStoreCoordinator {
        //            for store in persistentStoreCoordinator.persistentStores {
        //                guard let storeURL = store.url else { continue }
        //                do {
        //                    try persistentStoreCoordinator.destroyPersistentStore(at: storeURL, ofType: NSSQLiteStoreType, options: nil)
        //                    try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        //                } catch {
        //                    XCTFail("Failed to reset Core Data store: \(error)")
        //                }
        //            }
        //        }
        
        // Reset SQLite
        let fileManager = FileManager.default
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dbURL = documentDirectory.appendingPathComponent("YourDatabaseName.sqlite")
            do {
                if fileManager.fileExists(atPath: dbURL.path) {
                    try fileManager.removeItem(at: dbURL)
                }
            } catch {
                XCTFail("Failed to reset SQLite database: \(error)")
            }
        }
        
        // Reset files in document directory
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            do {
                let fileURLs = try fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
                for fileURL in fileURLs {
                    try fileManager.removeItem(at: fileURL)
                }
            } catch {
                XCTFail("Failed to reset document directory: \(error)")
            }
        }
        
        // Clear UserDefaults
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
    }
    
    func reachAboutScreen() {
        vocabPage.menuButton.tap()
        mainPage.aboutMButton.tap()
        sleep(10)
    }
    
    func importAVocab(){
        vocabPage.menuButton.tap()
    }
    
    func reachIShareService(){
        vocabPage.menuButton.tap()
        mainPage.iShareServiceMButton.tap()
        sleep(5)
    }
    
    func randomString(length: Int) -> String{
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMN0123456789"
        return String((0..<length).map{ _ in characters.randomElement()! })
    }
    
    func deleteVocabFromVocabPageIfExisting(deleteCircle: String, maxScrolls: Int = 5, timeout: TimeInterval = 5) {
        var scrollAttempts = 0
        var textFound = false
        
        mainPage.editButton.tap()
        
        while scrollAttempts < maxScrolls {
            let circleDelete = app.tables/*@START_MENU_TOKEN@*/.images["minus.circle.fill"]/*[[".cells",".buttons[\"Remove Spelling SS Copy  Modified 30 May 2024 at 14:51, Copy of Spelling SS, ✓\"]",".images[\"remove\"]",".images[\"minus.circle.fill\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/
            
            // Check if there exists a copied vocab
            if circleDelete.exists {
                textFound = true
                
                let mainPage = MainPage(app: app, vocabName: "vocab")
                let vocabPage = VocabPage(app: app, vocabName: "vocab")
                app.tables.images[deleteCircle].tap()
                let deleteButton = app.tables.buttons["Delete"]
                let deleteButtonExists = deleteButton.waitForExistence(timeout: 5)
               
                mainPage.deleteVocabButtonSquare.tap()
                app.alerts["Delete Vocabulary"].scrollViews.otherElements.buttons["Continue"].tap()
                mainPage.verifyTextDoesNotExistScroll(textVerified: deleteCircle, maxScrolls: 3)
                // Wait for the text to disappear
                let textNotExistExpectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == false"), object: circleDelete)
                let result = XCTWaiter.wait(for: [textNotExistExpectation], timeout: timeout)
                
                if result == .completed {
                    textFound = false
                    break
                } else {
                    textFound = true
                    break
                }
            }
            
            // Scroll up to continue searching
            app.swipeUp()
            scrollAttempts += 1
            app.swipeDown()
        }
        
        mainPage.doneButton.tap()
        XCTAssertFalse(textFound, "The text '\(deleteCircle)' was found on the screen after \(scrollAttempts) scroll attempts.")
    }
    
    func scrollDownUntilElementIsVisible(element: XCUIElement, maxScrolls: Int = 10, timeout: TimeInterval = 10) {
        let startTime = Date()
        var scrollAttempts = 0
        
        while !element.exists || !element.isHittable {
            if scrollAttempts >= maxScrolls || Date().timeIntervalSince(startTime) >= timeout {
            }
            app.swipeUp()
            scrollAttempts += 1
            sleep(1)
        }
    }
    
    func scrollUpUntilElementIsVisible(element: XCUIElement, maxScrolls: Int = 10, timeout: TimeInterval = 10) {
        let startTime = Date()
        var scrollAttempts = 0
        
        while !element.exists || !element.isHittable {
            if scrollAttempts >= maxScrolls || Date().timeIntervalSince(startTime) >= timeout {
            }
            app.swipeDown()
            scrollAttempts += 1
            sleep(1)
        }
    }
    
    func assertElementExists(element: XCUIElement, timeout: TimeInterval = 5) -> Bool {
        let existsPredicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: element)
        
        let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
        return result == .completed
    }
    
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
        for i in 36...100 {
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
    
    func tapFirstLockedImage() {
        // Access the first image with the identifier 'locked'
        let lockedImages = app.images.matching(identifier: "locked")
        if lockedImages.count > 0 {
            let firstLockedImage = lockedImages.element(boundBy: 0)
            if firstLockedImage.exists {
                firstLockedImage.tap()
            } else {
                print("The first 'locked' image does not exist.")
            }
        } else {
            print("No images with the identifier 'locked' were found.")
        }
    }
    
    func reachMenuPageIfOnVocabPage() {
        
        if mainPage.menuButton.exists {
            if vocabPage.vocabButton.exists {
                vocabPage.vocabButton.tap()
                vocabPage.chooseNewVocab.tap()
                XCTAssert(mainPage.editButton.exists)}
            print("********* We reached the Vocab list page")
            
            // Access the element by its identifier
            let expandIndicator = app.images["expandIndicator"]
            
            // Check if the element exists
            let existsExpandIndicator = assertElementExists(element: expandIndicator, timeout: 5)
            
            if existsExpandIndicator {
                scrollUpUntilElementIsVisible(element: mainPage.cancelSearchButton)
                tapFirstLockedImage()
                print("********* We opened the first vocabulary")
                
                if vocabPage.vocabButton.exists{
                    vocabPage.vocabButton.tap()
                    vocabPage.chooseNewVocab.tap()
                    XCTAssert(mainPage.editButton.exists)}
                else {
                    print("********* The 'Vocabulary failed to open in reach menu if on vocab page func.")
                }
            }
            print("********* We already are on the vocabulary list screen.")
        }
    }
}
