//
//  Pages.swift
//  LAMPUITests
//
//  Created by Alin V on 21.11.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.


import Foundation
import XCTest

class Pages {
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
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
    
    func editPage() {
        sleep(5)
        app.navigationBars.buttons["Menu"].tap()
        app.buttons["Edit Page"].tap()
        sleep(2)
    }
    
    func openLanguagesRegionSection(){
        app.buttons["Menu"].tap()
        app.buttons["Language & Region"].tap()
        sleep(3)
    }
    
    func addLanguage(language: String){
        app.buttons["Add"].tap()
        app.staticTexts[language].tap()
    }
    
    func addNewPage(){
        app.navigationBars.buttons["Menu"].tap()
        let addNewPage = app.buttons["Add New Page"]
        let addNewPageExists = addNewPage.waitForExistence(timeout: 5)
        XCTAssertTrue(addNewPageExists, "The Add New Page button is not visible")
        addNewPage.tap()
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
    
    func addBackgroundColorSetImagePage(){
        let popoversQuery = XCUIApplication().popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let tablesQuery = popoversQuery.tables
        
        scrollViewsQuery.otherElements.buttons["Select Image"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Minspeak"]/*[[".cells.staticTexts[\"Minspeak\"]",".staticTexts[\"Minspeak\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["DEVICE TOOLS"]/*[[".cells.staticTexts[\"DEVICE TOOLS\"]",".staticTexts[\"DEVICE TOOLS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(3)
        tablesQuery.children(matching: .cell).element(boundBy: 0).staticTexts["Source: Minspeak"].tap()
        
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Page Name").children(matching: .button).element(boundBy: 2).tap()
        popoversQuery.tables/*@START_MENU_TOKEN@*/.staticTexts["Verb"]/*[[".cells.staticTexts[\"Verb\"]",".staticTexts[\"Verb\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func addBackgroundColorAndImage(){
        let popoversQuery = XCUIApplication().popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Page Name").children(matching: .button).element(boundBy: 1).tap()
        
        let tablesQuery = popoversQuery.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Noun"]/*[[".cells.staticTexts[\"Noun\"]",".staticTexts[\"Noun\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        scrollViewsQuery.otherElements.buttons["Select Image"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Minspeak"]/*[[".cells.staticTexts[\"Minspeak\"]",".staticTexts[\"Minspeak\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["DEVICE TOOLS"]/*[[".cells.staticTexts[\"DEVICE TOOLS\"]",".staticTexts[\"DEVICE TOOLS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.children(matching: .cell).element(boundBy: 0).staticTexts["Source: Minspeak"].tap()
    }
    
    func clearImageNewPage(){
        let popoversQuery = app.popovers
        
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Clear Image"].tap()
        popoversQuery.navigationBars["New Page"].buttons["Save"].tap()
    }
    
    func backToVocab(){
        let vocabButton = app.navigationBars.buttons["Vocab"]
        let vocabButtonExists = vocabButton.waitForExistence(timeout: 5)
        XCTAssertTrue(vocabButtonExists)
        vocabButton.tap()
        app.popovers.scrollViews.otherElements.buttons["Choose New Vocab"].tap()
        let editButtonPage = app.buttons["Edit"]
        let editButtonExists = editButtonPage.waitForExistence(timeout: 5)
        XCTAssertTrue(editButtonExists)
        
        //        XCUIApplication().tables.staticTexts["MyCore SS  "].tap()
    }
    
    func nameForPage(pageName: String){
        sleep(2)
        app.textFields.element(boundBy: 0).tap()
        app.textFields.element(boundBy: 0).typeText(pageName)
    }
    
    func checkThePageType(){
        app.staticTexts["Normal Page"].tap()
        let englishHomePage = app.staticTexts["English Home Page"]
        XCTAssertTrue(englishHomePage.exists)
        
        app.buttons["Cancel"].tap()
    }
    
    func checkIfThePageActionWorks(){
        let elements = app.buttons.allElementsBoundByIndex
        let vocabElementNumber = elements[7]
        let vocabWordVocab = app.buttons["Blank"]
        let nameElementVocab = app.buttons["Blank"]
        
        XCTAssertGreaterThan(elements.count, 3, "There are not enough elements")
        XCTAssertEqual(vocabElementNumber.label, "Blank", "The title is not correct")
        XCTAssertTrue(vocabWordVocab.exists);
        
        app.buttons["Done"].tap()
    }
    
    func skipRegisterModal(){
        let getStartedModal = app.staticTexts["Register to download voices and receive helpful tips, support and training information!"]
        let centerScreenCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: 0.2, dy: 0.2))
        // Adjust this based on the actual element type

        if getStartedModal.exists {
                    centerScreenCoordinate.tap()
                        sleep(1) // Adds a second pause
                }
    }
    
    func selectSpanishPageType(){
        let popoversQuery = XCUIApplication().popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let tablesQuery = popoversQuery.tables
        
        scrollViewsQuery.otherElements.staticTexts["Normal Page"].tap()
        let spanishPageType = app.staticTexts["Spanish Home Page"]
        XCTAssertTrue(spanishPageType.exists)
        spanishPageType.tap()
        XCUIApplication().popovers.navigationBars["Page Type"].buttons["Done"].tap()
    }
    
    func selectFrenchPageType(){
        let popoversQuery = XCUIApplication().popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        
        XCUIApplication().popovers.scrollViews.otherElements/*@START_MENU_TOKEN@*/.staticTexts["French (Canada)"]/*[[".buttons[\"French (Canada)\"].staticTexts[\"French (Canada)\"]",".staticTexts[\"French (Canada)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let frenchPageType = app.staticTexts["French (Canada)"]
        XCTAssertTrue(frenchPageType.exists)
        frenchPageType.tap()
    }
    
}
