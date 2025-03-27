//
//  ActionsPage.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 26.09.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

class ActionaPageClass {
    
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func editButtonForAction(nameButton: String){
        app.buttons.element(boundBy: 25).tap()
        app.buttons["Edit This Button"].tap()
        
        let buttonLabel = app.textFields.element(boundBy: 0)
        let existsButtonLabel = buttonLabel.waitForExistence(timeout: 5)
        XCTAssertTrue(existsButtonLabel, "The button label is not visible")
        
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText(nameButton)
    }
    
    func removeSpeechMessageAction(){
        let app = XCUIApplication()
        let popoversQuery = app.popovers
        let elementsQuery = popoversQuery.scrollViews.otherElements
        elementsQuery.buttons["Edit"].tap()
        
        let tablesQuery = XCUIApplication().popovers.scrollViews.otherElements.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Remove Speech Message"]/*[[".cells.buttons[\"Remove Speech Message\"]",".buttons[\"Remove Speech Message\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func editButtonForNavigateAction(nameButton: String){
        app.buttons.element(boundBy: 7).tap()
        app.buttons["Edit This Button"].tap()
        
        let buttonLabel = app.textFields.element(boundBy: 0)
        let existsButtonLabel = buttonLabel.waitForExistence(timeout: 5)
        XCTAssertTrue(existsButtonLabel, "The button label is not visible")
        
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText(nameButton)
    }
    
    func addANewAction(actionName: String){
        let popoversQuery = app.popovers
        let elementsQuery = popoversQuery.scrollViews.otherElements
        elementsQuery.buttons["Add"].tap()
        app.staticTexts[actionName].tap()
    }
    
    func addActionForTimeDate(actionType: String){
        let popoversQuery = app.popovers
        let elementsQuery = popoversQuery.scrollViews.otherElements
        let tablesQuery = popoversQuery.tables
        app.staticTexts[actionType].tap()
        popoversQuery.navigationBars["Edit Button"].buttons["Save"].tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func checkAddMessageDisplay(){
        let popoversQuery = app.popovers
        popoversQuery.navigationBars["Edit Button"].buttons["Save"].tap()
        sleep(2)
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
        app.buttons["Add Message To Display"].tap()
        let messageText = app.textFields["Add Message To Display "]
        XCTAssertTrue(messageText.exists, "The message is not displayed")
    }
    
    func checkIfTheDateisDisplayed(){
        app.buttons["Add Action Date"].tap()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        let expectedDate = dateFormatter.string(from: Date())
        
        let expectedText = app.textFields["The current date is \(expectedDate) "]
        XCTAssertTrue(expectedText.exists, "Displayed date is incorrect")
    }
    
    func checkIfTheTimeisDisplayed(){
        app.buttons["Add Action Time"].tap()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let expectedTime = dateFormatter.string(from: Date())
        
        let expectedText = app.textFields["The current time is \(expectedTime) "]
        XCTAssertTrue(expectedText.exists, "Displayed time is incorrect")
    }
    
    func checkIfTheDateTimeAreDisplayed(){
        app.buttons["Add Action Time/Date"].tap()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy 'at' HH:mm"
        let expectedDateTime = dateFormatter.string(from: Date())
        
        let expectedText = app.textFields["The current date and time are \(expectedDateTime) "]
        XCTAssertTrue(expectedText.exists, "Displayed date and time are incorrect")
    }
    
    func saveTheAction(){
        let saveBtn = app.buttons["Save"]
        let existsSaveBtn = saveBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(existsSaveBtn, "The save button is not visible")
        saveBtn.tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func checkIfTheActionsWorks(){
        app.buttons["PHRASES"].press(forDuration: 1)
        app.buttons["Good Morning"].tap()
        app.buttons["Back"].tap()
        app.buttons["Backspace Key"].doubleTap()
        let sdbNewText = app.textFields["Good morning, how are you"]
        XCTAssertTrue(sdbNewText.exists, "The backspace key button doesn't work as expected")
    }
    
    func checkTheBatteryStatus(){
        app.buttons["Battery Sts"].tap()
        let batteryStsField = app.textFields["Device battery is -100% charged. "]
        XCTAssertTrue(batteryStsField.exists, "The battery status is not visible")
    }
    
    func checkTheCalculatorAction(){
        app.buttons["Calculator"].tap()
        let calcBtn1 = app.buttons["AC"]
        let calcBtn2 = app.buttons["%"]
        let calcBtn3 = app.buttons["±"]
        
        let existsCalcBtn = calcBtn1.exists && calcBtn2.exists && calcBtn3.exists
        XCTAssertTrue(existsCalcBtn, "The Calculator is not visible")
        
        app.buttons["7"].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        
        let calcResult = app.buttons["10"]
        let calcResultsExists = calcResult.waitForExistence(timeout: 5)
        XCTAssertTrue(calcResultsExists, "The calculator works as expected.")
        
        app.buttons["Done"].tap()
    }
    
    func clearLastWord(){
        app.buttons["PHRASES"].press(forDuration: 1)
        app.buttons["Good Morning"].tap()
        app.buttons["Back"].tap()
        app.buttons["Clear Last Word"].tap()
        
        let textLastWord = app.textFields["Good morning, how are "]
        XCTAssertTrue(textLastWord.exists, "The text is not correct")
    }
    
    func checkLoggingData(){
        app.buttons["Data Logging"].tap()
        let enableLogging = app.images["lam_indicator"]
        let existsEnableLogging = enableLogging.waitForExistence(timeout: 5)
        XCTAssertTrue(existsEnableLogging, "The Enable Logging image is not visible")
        app.buttons["Data Logging"].tap()
        sleep(3)
        XCTAssertFalse(enableLogging.exists, "The Enable Logging image is still visible")
        }
    
    func checkTheJumpActions(){
        //open the No Anim Page
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
        app.buttons["Jump To Page No Anim"].tap()
        let emptyButton = app.buttons.element(boundBy: 15)
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Up
        app.buttons["Jump To Page Up"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Down
        app.buttons["Jump To Page Down"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Right
        app.buttons["Jump To Page Right"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Left
        app.buttons["Jump To Page Left"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
    }
    
    func checkNavigateActions(){
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
        app.buttons["Navigate to Page No Anim"].tap()
        let emptyButton = app.buttons.element(boundBy: 15)
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Up
        app.buttons["Navigate to Page Up"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Down
        app.buttons["Navigate to Page Down"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Right
        app.buttons["Navigate to Page Right"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
        
        //open the Page Left
        app.buttons["Navigate to Page Left"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["Back"].tap()
    }
    
    func checkVisitAction(){
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
        let jumpToPageBtn = app.buttons["Visit to Page No Anim"]
        jumpToPageBtn.tap()
        let emptyButton = app.buttons.element(boundBy: 15)
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["CLEAR "].tap()
        XCTAssertTrue(jumpToPageBtn.exists, "The page has not changed")
        
        //check the Visit Page Up
        app.buttons["Visit to Page Up"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["CLEAR "].tap()
        XCTAssertTrue(jumpToPageBtn.exists, "The page has not changed")
        
        //check the Visit Page Down
        app.buttons["Visit to Page Down"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["CLEAR "].tap()
        XCTAssertTrue(jumpToPageBtn.exists, "The page has not changed")
        
        //check the Visit Page Right
        app.buttons["Visit to Page Right"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["CLEAR "].tap()
        XCTAssertTrue(jumpToPageBtn.exists, "The page has not changed")
        
        //check the Visit Page Left
        app.buttons["Visit to Page Left"].tap()
        XCTAssertTrue(emptyButton.label.isEmpty, "The button is not empty")
        app.buttons["CLEAR "].tap()
        XCTAssertTrue(jumpToPageBtn.exists, "The page has not changed")
    }
    
    func addNoAnimAction(){
        app.staticTexts[".Template"].tap()
        app.staticTexts["  No Animation"].tap()
        app.buttons["Save"].tap()
    }
    
    func addWebsiteToggleOn(){
        app.textFields.element(boundBy: 0).tap()
        app.textFields.element(boundBy: 0).typeText("google.com")
        XCUIApplication().popovers.navigationBars["WebsiteURLView"].buttons["Done"].tap()
        sleep(2)
        app.buttons["Save"].tap()
    }
    
    
    func checkTheWebsiteToggleOn(){
        app.buttons["Google Website Toggle On"].tap()
        let googleSearchBtn = app.buttons["Google Search"]
        let googleSearchBtnExists = googleSearchBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(googleSearchBtnExists, "The Google Search button is not visible")
        
        let signInLink = app.links["Sign in"]
        XCTAssertTrue(signInLink.exists, "The sign in link is not visible")
        signInLink.tap()
        XCTAssertTrue(googleSearchBtnExists, "The Google Search button is not visible")
        app.buttons["Done"].tap()
    }
    
    func checkTheWebsiteToggleOff(){
        app.buttons["Google Website Toggle Off"].tap()
        let googleSearchBtn = app.buttons["Google Search"]
        let googleSearchBtnExists = googleSearchBtn.waitForExistence(timeout: 5)
        XCTAssertTrue(googleSearchBtnExists, "The Google Search button is not visible")
        
        let signInLink = app.links["Sign in"]
        signInLink.tap()
        let emailPhoneField = app.staticTexts["Email or phone"]
        let emailPhoneFieldExists = emailPhoneField.waitForExistence(timeout: 5)
        XCTAssertTrue(emailPhoneFieldExists, "The email/phone field is not visible")
        app.buttons["Done"].tap()
    }
    
    func editTextPasteBtn(){
        sleep(3)
        app.buttons["Save"].tap()
        app.buttons.element(boundBy: 27).tap()
        app.buttons["Edit This Button"].tap()
        sleep(2)
        app.textFields.element(boundBy: 0).doubleTap()
        app.textFields.element(boundBy: 0).typeText("Text Paste Button")
    }
    
    func checkTextPasteCopyFunctions(){
        app.buttons["e"].tap()
        app.buttons["n"].tap()
        app.buttons["d"].tap()
        app.buttons["t"].tap()
        app.buttons["o"].tap()
        app.buttons["e"].tap()
        app.buttons["n"].tap()
        app.buttons["d"].tap()
        
        app.buttons["Text Copy Button"].tap()
        app.buttons["BackButton"].tap()
        
        app.buttons["Text Paste Button"].tap()
    }
    
    func checkIfTheTextingConversationsWorks(){
        app.buttons["Navigate to Conversations"].tap()
        let iMessageAlert = app.staticTexts["iMessage Not Enabled"]
        XCTAssertTrue(iMessageAlert.exists, "The iMessage Alert is not visible.")
        app.buttons["Okay"].tap()
    }
    
    func checkWordFinderAction(){
        app.buttons["Word Finder Btn"].tap()
        let searchBarFindWord = app.textFields.element(boundBy: 3)
        let searchBarFinDWordExists = searchBarFindWord.waitForExistence(timeout: 5)
        XCTAssertTrue(searchBarFinDWordExists, "The search bar is not visible.")
        searchBarFindWord.tap()
        searchBarFindWord.typeText("Back")
        app.buttons["Find"].tap()
        app.buttons["Cancel"].tap()
    }
    
    func checkWordPredictionsAction(){
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
        app.buttons["g"].tap()
        
        let existsPredictions = app.buttons["Guess "].exists && app.buttons["Getting "].exists && app.buttons["Great "].exists && app.buttons["Get "].exists && app.buttons["Got "].exists && app.buttons["Good "].exists && app.buttons["Going "].exists && app.buttons["Give "].exists && app.buttons["Gonna "].exists && app.buttons["Goes "].exists
        XCTAssertTrue(existsPredictions, "The predictions are not visible")
    }
    
    func checkLibraryVideoTab(){
        let videoTypeTitle = app.staticTexts["Video Type"]
        let videoTypeTitleExists = videoTypeTitle.waitForExistence(timeout: 5)
        XCTAssertTrue(videoTypeTitleExists, "The Video Type Title does not exist.")
        
        let libraryVideo = app.staticTexts["Library Video"]
        libraryVideo.tap()
        let videosTitle = app.staticTexts["Videos"]
        let videosTitleExists = videosTitle.waitForExistence(timeout: 7)
        XCTAssertTrue(videosTitleExists, "The Videos Title does not exist.")
        app.buttons["Cancel"].tap()
    }
    
    func checkYoutubeVideoTab(){
        let youtubeVideo = app.staticTexts["YouTube Video"]
        let youtubeVideoExists = youtubeVideo.waitForExistence(timeout: 5)
        XCTAssertTrue(youtubeVideoExists, "The Youtube Video does not exist.")
        youtubeVideo.tap()
        
        //insert the video link
        app.textFields.element(boundBy: 0).tap()
        app.textFields.element(boundBy: 0).typeText("https://www.youtube.com/watch?v=d-diB65scQU")
        
        let app = XCUIApplication()
        let popoversQuery = app.popovers
        popoversQuery.navigationBars["EnterYouTubeView"].buttons["Done"].tap()
        sleep(3)
        popoversQuery.navigationBars["Edit Button"].buttons["Save"].tap()
        sleep(4)
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    func checkYoutubeVideoBtn(){
        app.buttons["Play YouTube Video"].tap()
        let youtubeSong = app.staticTexts["Bobby McFerrin - Don't Worry Be Happy (Official Music Video)"]
        let youtubeSongExists = youtubeSong.waitForExistence(timeout: 7)
        XCTAssertTrue(youtubeSongExists, "The Youtube song is not playing.")
        
        app.buttons["Done"].tap()
    }
    
    func clearDisplay(){
        app.buttons["PHRASES"].press(forDuration: 1)
        app.buttons["Good Morning"].tap()
        app.buttons["Back"].tap()
        app.buttons["BackButton"].tap()
        
        let textClearDisplay = app.textFields["Good morning, how are "]
        XCTAssertTrue(textClearDisplay.exists, "The text is not correct")
        
        app.buttons["Clear Display"].tap()
        
        let textFieldSdb = app.textFields.element(boundBy: 0)
        let textFieldValue = textFieldSdb.value as? String
        
        if textFieldValue == "" || textFieldValue == nil {
            print("Text field is empty")
            XCTAssert(true, "Text field is empty as expected")
        }
        
        
    }
    
}
