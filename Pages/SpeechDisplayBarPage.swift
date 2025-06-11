//  SpeechDisplayBarPage.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 09.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

class SpeechDisplayBarPage {
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func checkTheHideDisplayBar(){
        XCUIApplication().popovers.tables.staticTexts["Speech"].swipeUp()
        
        let hideSpeechDisplayBar = app.switches.element(boundBy: 9)
        hideSpeechDisplayBar.tap()
        XCTAssertFalse(app.buttons["BackButton"].exists, "The Back button is still available")
        hideSpeechDisplayBar.tap()
    }
    
    func checkAutoCapitalization(){
        let autoCapitalization = app.switches.element(boundBy: 11)
        autoCapitalization.tap()
        app.buttons["Done"].tap()
        app.buttons["t"].tap()
        app.buttons["e"].tap()
        app.buttons["s"].tap()
        app.buttons["t"].tap()
    }
    
    func checkHideDeleteButton(){
        let hideDeleteButton = app.switches.element(boundBy: 13)
        hideDeleteButton.tap()
        
        XCTAssertFalse(app.buttons["BackButton"].exists, "The Back button is still available")
        hideDeleteButton.tap()
    }
    
    func checkFontsType(){
        let popoversQuery = XCUIApplication().popovers
        XCUIApplication().popovers.tables.children(matching: .cell).element(boundBy: 21).staticTexts["Font"].tap()
        
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
                
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
    }
    
    func checkFontSize(){
        let popoversQuery = XCUIApplication().popovers
        let tablesQuery = popoversQuery.tables
        tablesQuery.cells.containing(.staticText, identifier:"30 Point").staticTexts["Font Size"].tap()
        
        let fourteenthWidth = app.staticTexts["14 Point"]
        let thirtyPointWidth = app.staticTexts["30 Point"]
        let seventyTwoPointWidth = app.staticTexts["72 Point"]
        
        let existsPointWidth = fourteenthWidth.exists && thirtyPointWidth.exists && seventyTwoPointWidth.exists
        
        XCTAssertTrue(existsPointWidth, "One or more specified points don't exist")
        
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
    }
    
    func checkFontColor(){
        let popoversQuery = XCUIApplication().popovers
        let tablesQuery = popoversQuery.tables
        tablesQuery.children(matching: .cell).element(boundBy: 23).staticTexts["Font Color"].tap()
       
         
        let redTextColor = app.staticTexts["Red"]
        let brownTextColor = app.staticTexts["Brown"]
        let blueTextColor = app.staticTexts["Blue"]
        let cyanTextColor = app.staticTexts["Cyan"]
        let purpleTextColor = app.staticTexts["Purple"]
        
        let existsTextColor = redTextColor.exists && brownTextColor.exists && blueTextColor.exists && cyanTextColor.exists && purpleTextColor.exists
        
        XCTAssertTrue(existsTextColor, "One or more specified text colors don't exist")
        
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
    }
    
    func checkBackgroundColor(){
        let popoversQuery = XCUIApplication().popovers
        let tablesQuery = popoversQuery.tables
        tablesQuery.children(matching: .cell).element(boundBy: 24).staticTexts["Background Color"].tap()
                        
        let redBackgroundColor = app.staticTexts["Red"]
        let brownBackgroundColor = app.staticTexts["Brown"]
        let blueBackgroundColor = app.staticTexts["Blue"]
        let cyanBackgroundColor = app.staticTexts["Cyan"]
        let purpleBackgroundColor = app.staticTexts["Purple"]
        
        let existsBacgkroundColors = redBackgroundColor.exists && brownBackgroundColor.exists && blueBackgroundColor.exists && cyanBackgroundColor.exists && purpleBackgroundColor.exists
        
        XCTAssertTrue(existsBacgkroundColors, "One or more specified text colors don't exist")
        
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
    }
    
    func checkNumberOfLines(){
        let popoversQuery = XCUIApplication().popovers
        let tablesQuery = popoversQuery.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Number of Lines"]/*[[".cells.staticTexts[\"Number of Lines\"]",".staticTexts[\"Number of Lines\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let oneLine = app.staticTexts["1 Line"]
        let fiveLines = app.staticTexts["5 Lines"]
        let tenLines = app.staticTexts["10 Lines"]
        
        let existsLines = oneLine.exists && fiveLines.exists && tenLines.exists
        
        XCTAssertTrue(existsLines, "One or more specified points don't exist")
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
    }
    
    func checkTheCursor(){
        let visibleCursor = app.switches.element(boundBy: 15)
        visibleCursor.tap()
        visibleCursor.tap()
    }
    
    func checkTheHighlightSpoken(){
        let popoversQuery = XCUIApplication().popovers
        let tablesQuery = popoversQuery.tables
        let highlightSpokenWordStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Highlight Spoken Word"]/*[[".cells.staticTexts[\"Highlight Spoken Word\"]",".staticTexts[\"Highlight Spoken Word\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        highlightSpokenWordStaticText.tap()
        
        let offOption = app.staticTexts["OFF"]
        let brownOption = app.staticTexts["Brown"]
        let blueOption = app.staticTexts["Blue"]
        let cyanOption = app.staticTexts["Cyan"]
        let purpleOption = app.staticTexts["Purple"]
        
        let existsHighlights = offOption.exists && brownOption.exists && blueOption.exists && cyanOption.exists && purpleOption.exists
        
        XCTAssertTrue(existsHighlights, "One or more specified points don't exist")
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
    }
    
    func checkHighlightColorPhone(){
        let popoversQuery = XCUIApplication().popovers
        let tablesQuery = popoversQuery.tables
        let highlightColorPhone = tablesQuery.staticTexts["Highlight Color Phone/FaceTime"]
        highlightColorPhone.tap()
        
        let redColorHighlight = app.staticTexts["Red"]
        let brownColorHighlight = app.staticTexts["Brown"]
        let blueColorHighlight = app.staticTexts["Blue"]
        let cyanColorHighlight = app.staticTexts["Cyan"]
        let purpleColorHighlight = app.staticTexts["Purple"]
        
        let existsHighlightsPhone = redColorHighlight.exists && brownColorHighlight.exists && blueColorHighlight.exists && cyanColorHighlight.exists && purpleColorHighlight.exists
        
        XCTAssertTrue(existsHighlightsPhone, "One or more specified points don't exist")
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
        
        app.buttons["Done"].tap()
    }
}
