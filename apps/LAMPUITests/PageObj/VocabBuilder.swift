//
//  VocabBuilder.swift
//  LAMPUITests
//
//  Created by Alin V on 29.11.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

class VocabBuilder {
    
    let quickEditBtn: XCUIElement
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
        quickEditBtn = app.buttons["Quick Edit"]
    }
    
    func openVocabBuilder() {
        app.navigationBars.buttons["Menu"].tap()
        app.buttons["Vocab Builder"].tap()
        
        let vocabBuilderTitle = app.staticTexts["Vocab Builder"]
        let vocabBuilderTiltleExists = vocabBuilderTitle.waitForExistence(timeout: 10)
        XCTAssertTrue(vocabBuilderTiltleExists)
    }
    
    func checkAvailableWords(){
        let visibleActions = app.staticTexts["VISIBLE ACTIONS"]
        let finishedWord = app.staticTexts["finished"]
        let youWord = app.staticTexts["you"]
        
        let vocabBuildWordsExists = visibleActions.exists && finishedWord.exists && youWord.exists
        
        XCTAssertTrue(vocabBuildWordsExists, "The Vocab Builder section is not visible")
    }
    
    func searchForAWord(){
        app.searchFields["Search"].tap()
        app.searchFields["Search"].typeText("there")
        let thereWord = app.staticTexts["there"]
        
        XCTAssertTrue(thereWord.isHittable, "The there Workd should be visible and interactable.")
    }
    
    func checkFileListTab(){
        app.buttons["File List"].tap()
        app.staticTexts["🔒 LAMP WFL Transition"].tap()
        
        let loadFileBtn = app.buttons["Load File"]
        let copyToDropBoxBtn = app.buttons["Copy to DropBox"]
        let shareFileBtn = app.buttons["Share File"]
        let shareFileBtnExists = shareFileBtn.waitForExistence(timeout: 10)
        XCTAssertTrue(shareFileBtnExists)
        
        let existsFileListOption = loadFileBtn.exists && copyToDropBoxBtn.exists && shareFileBtn.exists
        
        XCTAssertTrue(existsFileListOption, "The File List Options are correct")
        let centerScreenCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: 0.3, dy: 0.3))
        centerScreenCoordinate.tap()
        app.buttons["Cancel"].tap()
        app.buttons["Done"].tap()
    }
    
    func saveTheNewList(){
        app.buttons["Save List"].tap()
        app.textFields["File Name"].tap()
        app.textFields["File Name"].typeText("New list by e2e")
        app.buttons["Save"].tap()
        
        let fileSavedModal = app.staticTexts["File Saved Successfully"]
        let fileSavedModalExists = fileSavedModal.waitForExistence(timeout: 5)
        XCTAssertTrue(fileSavedModalExists, "The File wasn't saved")
        
        app.buttons["Okay"].tap()
    }
    
    func checkIfTheListWasSaved(){
        app.buttons["File List"].tap()
        let newListName = app.staticTexts["New list by e2e.txt"]
        XCTAssertTrue(newListName.exists, "The new list is not visible")
        app.buttons["Cancel"].tap()
        app.buttons["Done"].tap()
    }
    
    func enterAnIncorrectWord(){
        app.textFields.element(boundBy: 3).tap()
        app.textFields.element(boundBy: 3).typeText("tiol")
        let addWordBtn = app.buttons["Add Word"]
        XCTAssertFalse(addWordBtn.isEnabled, "The Add Word Button is enabled")
    }
    
    func enterACorrectWordPhrase(){
        app.textFields.element(boundBy: 3).doubleTap()
        app.textFields.element(boundBy: 3).typeText("there")
        let addWordBtn = app.buttons["Add Word"]
        XCTAssertTrue(addWordBtn.isEnabled, "The Add Word Button is disabled")
        addWordBtn.tap()
        app.textFields.element(boundBy: 3).doubleTap()
        app.textFields.element(boundBy: 3).typeText("Do they like")
        addWordBtn.tap()
    }
    
    func editListAndCheckTheOptions(){
        app.buttons["Edit List"].tap()
        app.buttons["Remove there"].tap()
        
        let deleteBtn = app.buttons["Delete"]
        XCTAssertTrue(deleteBtn.exists, "The delete button is not visible")
        app.buttons["Done Editing"].tap()
        XCTAssertFalse(deleteBtn.exists, "The delete button is still visible")
        app.buttons["Save"].tap()
    }
    
    func enableChangesAndCheckHowItWork(){
        app.buttons["Show Enabled"].tap()
        
        let thereWord = app.staticTexts["there"]
        let phrase = app.staticTexts["do they like"]
        
        let existsWordPhrase = thereWord.exists && phrase.exists
        XCTAssertTrue(existsWordPhrase, "The words are not visible")
        
        app.buttons["Done"].tap()
        
        let tenthButton = app.buttons.element(boundBy: 9)
        let twentythButton = app.buttons.element(boundBy: 19)
        let thirtyfifthButton = app.buttons.element(boundBy: 34)
        
        let buttonsAreEnabled = tenthButton.isEnabled && twentythButton.isEnabled && thirtyfifthButton.isEnabled
        XCTAssertFalse(buttonsAreEnabled, "The buttons are enabled")
        
        let thereBtn = app.buttons["there "]
        let likeBtn = app.buttons["like "]
        
        let thereLikeBtnsExists = thereBtn.exists && likeBtn.exists
        XCTAssertTrue(thereLikeBtnsExists, "The buttons are not visible")
    }
    
    func disableAllWordsAndCheckHowItWork(){
        app.buttons["Disable All"].tap()
        app.buttons["Done"].tap()
        sleep(3)
        let thereBtn = app.buttons["there "]
        let likeBtn = app.buttons["like "]
        XCTAssertFalse(thereBtn.exists, "The there button is still visible")
        XCTAssertFalse(likeBtn.exists, "The like button is still visible")
    }
}
