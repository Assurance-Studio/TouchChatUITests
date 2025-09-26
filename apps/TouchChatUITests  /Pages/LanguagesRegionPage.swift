//
//  LanguagesRegionPage.swift
//  TouchChatAppUITests
//
//  Created by Alin Voinescu on 12.03.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

class LanguagesRegionPage {
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
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
    
    func changeEnglishVoice(){
            XCUIApplication().popovers.tables/*@START_MENU_TOKEN@*/.staticTexts["English voice"]/*[[".cells.staticTexts[\"English voice\"]",".staticTexts[\"English voice\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            app.staticTexts["Samantha"].tap()
            app.staticTexts["Liam (child)"].tap()
            // Check how many "DownloadButton" elements exist before starting the download
            let initialDownloadButtonsCount = app.buttons.matching(identifier: "arrow.down").count
            XCTAssertGreaterThan(initialDownloadButtonsCount, 0, "There should be at least one 'DownloadButton'")
            
            // Wait until the number of "DownloadButton" buttons decreases by 1
            let expectation = XCTNSPredicateExpectation(
                        predicate: NSPredicate(format: "count == %d", initialDownloadButtonsCount - 1),
                        object: app.buttons.matching(identifier: "arrow.down")
                    )

                    // Wait until the number of "DownloadButton" buttons decreases by 1
                    let result = XCTWaiter.wait(for: [expectation], timeout: 500)

                    // Check if the waiting succeeded
                    if result == .completed {
                        XCTAssertEqual(app.buttons.matching(identifier: "arrow.down").count, initialDownloadButtonsCount - 1, "One 'DownloadButton' should have disappeared after the download started")
                    } else {
                        XCTFail("The 'DownloadButton' did not disappear within the timeout period")
                    }
            
            app.staticTexts["Liam (child)"].tap()
            app.buttons["Back"].tap()
        }
        
    
    func checkArabicVoice(){
           XCUIApplication().popovers.tables.staticTexts["Arabic voice"].tap()
           app.staticTexts["Majed"].tap()
           app.staticTexts["Jalal"].tap()
           // Check how many "DownloadButton" elements exist before starting the download
           let initialDownloadButtonsCount = app.buttons.matching(identifier: "arrow.down").count
           XCTAssertGreaterThan(initialDownloadButtonsCount, 0, "There should be at least one 'DownloadButton'")
           
           // Wait until the number of "DownloadButton" buttons decreases by 1
           let expectation = XCTNSPredicateExpectation(
                       predicate: NSPredicate(format: "count == %d", initialDownloadButtonsCount - 1),
                       object: app.buttons.matching(identifier: "arrow.down")
                   )

                   // Wait until the number of "DownloadButton" buttons decreases by 1
                   let result = XCTWaiter.wait(for: [expectation], timeout: 500)

                   // Check if the waiting succeeded
                   if result == .completed {
                       XCTAssertEqual(app.buttons.matching(identifier: "arrow.down").count, initialDownloadButtonsCount - 1, "One 'DownloadButton' should have disappeared after the download started")
                   } else {
                       XCTFail("The 'DownloadButton' did not disappear within the timeout period")
                   }
           app.staticTexts["Jalal"].tap()
           app.buttons["Back"].tap()
       }
    
    func trySelectAcapelaVoice(){
        XCUIApplication().popovers.tables.staticTexts["French (Canada) voice"].tap()
        app.staticTexts["Amélie"].tap()
        let acapelaAnaisVoice = app.staticTexts["Anais"]
        XCTAssertFalse(acapelaAnaisVoice.exists)
        app.buttons["Cancel"].tap()
        app.buttons["Back"].tap()
        app.buttons["Done"].tap()
    }
    
    func changeEnglishVoiceToAlmaguVoice(){
            XCUIApplication().popovers.tables/*@START_MENU_TOKEN@*/.staticTexts["English voice"]/*[[".cells.staticTexts[\"English voice\"]",".staticTexts[\"English voice\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            app.staticTexts["Samantha"].tap()
            app.staticTexts["William (teen)"].tap()
            // Check how many "DownloadButton" elements exist before starting the download
            let initialDownloadButtonsCount = app.buttons.matching(identifier: "arrow.down").count
            XCTAssertGreaterThan(initialDownloadButtonsCount, 0, "There should be at least one 'DownloadButton'")
            
            // Wait until the number of "DownloadButton" buttons decreases by 1
            let expectation = XCTNSPredicateExpectation(
                        predicate: NSPredicate(format: "count == %d", initialDownloadButtonsCount - 1),
                        object: app.buttons.matching(identifier: "arrow.down")
                    )

                    let result = XCTWaiter.wait(for: [expectation], timeout: 500)

                    // Check if the waiting succeeded
                    if result == .completed {
                        XCTAssertEqual(app.buttons.matching(identifier: "arrow.down").count, initialDownloadButtonsCount - 1, "One 'DownloadButton' should have disappeared after the download started")
                    } else {
                        XCTFail("The 'DownloadButton' did not disappear within the timeout period")
                    }
            app.staticTexts["William (teen)"].tap()
            app.buttons["Back"].tap()
        }
    
    func changeEnglishVoiceToAlmaguVoiceMegaTest(){
            XCUIApplication().popovers.tables/*@START_MENU_TOKEN@*/.staticTexts["English voice"]/*[[".cells.staticTexts[\"English voice\"]",".staticTexts[\"English voice\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            app.staticTexts["Liam (child)"].tap()
            app.staticTexts["William (teen)"].tap()
            // Check how many "DownloadButton" elements exist before starting the download
            let initialDownloadButtonsCount = app.buttons.matching(identifier: "arrow.down").count
            XCTAssertGreaterThan(initialDownloadButtonsCount, 0, "There should be at least one 'DownloadButton'")
            
            // Wait until the number of "DownloadButton" buttons decreases by 1
            let expectation = XCTNSPredicateExpectation(
                        predicate: NSPredicate(format: "count == %d", initialDownloadButtonsCount - 1),
                        object: app.buttons.matching(identifier: "arrow.down")
                    )

                    let result = XCTWaiter.wait(for: [expectation], timeout: 500)

                    // Check if the waiting succeeded
                    if result == .completed {
                        XCTAssertEqual(app.buttons.matching(identifier: "arrow.down").count, initialDownloadButtonsCount - 1, "One 'DownloadButton' should have disappeared after the download started")
                    } else {
                        XCTFail("The 'DownloadButton' did not disappear within the timeout period")
                    }
            app.staticTexts["William (teen)"].tap()
            app.buttons["Back"].tap()
        }
    
    func trySelectAlmaguVoice(){
        XCUIApplication().popovers.tables.staticTexts["Chinese (China mainland) voice"].tap()
        app.staticTexts["Tingting"].tap()
        let acapelaAnaisVoice = app.staticTexts["Mei "]
        XCTAssertTrue(acapelaAnaisVoice.exists)
        app.buttons["Cancel"].tap()
        app.buttons["Back"].tap()
        app.buttons["Done"].tap()
    }
}
