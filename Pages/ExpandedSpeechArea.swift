//  ExpandedSpeechArea.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 26.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import Foundation
import XCTest

class ExpandedSpeechDisplayArea {
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func checkTheFontOptions(){
        let popoversQuery = XCUIApplication().popovers
        let tablesQuery = popoversQuery.tables
        tablesQuery.staticTexts["Speech"].swipeUp()
        tablesQuery.staticTexts["Speech Display Bar"].swipeUp()
        tablesQuery.staticTexts["Expanded Speech Area"].swipeUp()
        XCUIApplication().popovers/*@START_MENU_TOKEN@*/.tables.containing(.other, identifier:"Vertical scroll bar, 4 pages")/*[[".tables.containing(.other, identifier:\"Buttons\")",".tables.containing(.other, identifier:\"Data Logging\")",".tables.containing(.other, identifier:\"Speak\")",".tables.containing(.other, identifier:\"Expanded Speech Area\")",".tables.containing(.other, identifier:\"Speech Display Bar\")",".tables.containing(.other, identifier:\"Vertical scroll bar, 4 pages\")"],[[[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .cell).element(boundBy: 30).staticTexts["Font"].tap()
        
         
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
        let font14 = app.staticTexts["Marker Felt"]
        
        let fontsExist = font1.exists && font2.exists && font3.exists && font4.exists && font5.exists && font6.exists && font7.exists && font8.exists && font9.exists && font10.exists && font11.exists && font12.exists && font13.exists && font14.exists
        
        XCTAssertTrue(fontsExist, "One or more specified fonts don't exist")
        
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
    }
    
    func checkBackgroundColors(){
        let popoversQuery = XCUIApplication().popovers
        let tablesQuery = popoversQuery.tables
        popoversQuery.tables.children(matching: .cell).element(boundBy: 33).staticTexts["Background Color"].tap()
        
        let redBackgroundColor = app.staticTexts["Red"]
        let brownBackgroundColor = app.staticTexts["Brown"]
        let blueBackgroundColor = app.staticTexts["Blue"]
        let cyanBackgroundColor = app.staticTexts["Cyan"]
        let purpleBackgroundColor = app.staticTexts["Purple"]
        
        let existsBacgkroundColors = redBackgroundColor.exists && brownBackgroundColor.exists && blueBackgroundColor.exists && cyanBackgroundColor.exists && purpleBackgroundColor.exists
        
        XCTAssertTrue(existsBacgkroundColors, "One or more specified text colors don't exist")
        
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
        
        app.buttons["Done"].tap()
    }
    
    func checkTheFontColors(){
        let popoversQuery = XCUIApplication().popovers
        popoversQuery/*@START_MENU_TOKEN@*/.tables.containing(.other, identifier:"Vertical scroll bar, 4 pages")/*[[".tables.containing(.other, identifier:\"Buttons\")",".tables.containing(.other, identifier:\"Data Logging\")",".tables.containing(.other, identifier:\"Speak\")",".tables.containing(.other, identifier:\"Expanded Speech Area\")",".tables.containing(.other, identifier:\"Speech Display Bar\")",".tables.containing(.other, identifier:\"Vertical scroll bar, 4 pages\")"],[[[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .cell).element(boundBy: 32).staticTexts["Font Color"].tap()
        let redBackgroundColor = app.staticTexts["Red"]
        let brownBackgroundColor = app.staticTexts["Brown"]
        let blueBackgroundColor = app.staticTexts["Blue"]
        let cyanBackgroundColor = app.staticTexts["Cyan"]
        let purpleBackgroundColor = app.staticTexts["Purple"]
        
        let existsBacgkroundColors = redBackgroundColor.exists && brownBackgroundColor.exists && blueBackgroundColor.exists && cyanBackgroundColor.exists && purpleBackgroundColor.exists
        
        XCTAssertTrue(existsBacgkroundColors, "One or more specified text colors don't exist")
        
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
    }
    
    func checkTheFontSize(){
        let popoversQuery = XCUIApplication().popovers
        let tablesQuery = popoversQuery.tables
        let fontSizeStaticText = tablesQuery.cells.containing(.staticText, identifier:"80 Point").staticTexts["Font Size"]
        fontSizeStaticText.tap()
        
        let twentyPoint = app.staticTexts["20 Point"]
        let oneHundredPoint = app.staticTexts["100 Point"]
        let twoHundredPoint = app.staticTexts["200 Point"]
        
        let existsPoint = twentyPoint.exists && oneHundredPoint.exists && twoHundredPoint.exists
        
        XCTAssertTrue(existsPoint, "One or more specified points don't exist")
        
        popoversQuery.navigationBars["SelectListView"].buttons["Cancel"].tap()
    }
}
