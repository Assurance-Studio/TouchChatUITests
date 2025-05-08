//
//  Modifiers.swift
//  TouchChatUITests
//
//  Created by Alin V on 10.01.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

class ModifiersPageClass {
    
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func importVocab(){
        app.buttons["Import/Export Vocab"].tap()
        sleep(2)
        app.buttons["Import from Files"].tap()
        sleep(5)
        app.staticTexts["Downloads"].tap()
        app.staticTexts["000_nmodifiers.ce"].tap()
        app.buttons["Open"].tap()
        sleep(3)
        
        app.textFields["Description of the voab ulary file"].tap()
        app.textFields["Description of the voab ulary file"].typeText("modifiers vocab")
        app.buttons["Import"].tap()
    }
    
    func openModifiersVocab(){
        app.staticTexts["000_modifiers"].tap()
       sleep(3)
        app.buttons["gotomodif"].tap()
    }
    
    func checkShiftBtn(){
        let shiftBtn = app.buttons["Shift"]
        let expectedShiftBtn = app.buttons["Shift mod"]
        shiftBtn.tap()
        XCTAssertTrue(expectedShiftBtn.exists, "The expected Shift Btn is not visible")
    }
    
    func checkCTRLBtn(){
        let ctrlBtn = app.buttons["CTRL"]
        let expectedCTRLBtn = app.buttons["Control Mod"]
        ctrlBtn.tap()
        XCTAssertTrue(expectedCTRLBtn.exists, "The CTRL Btn is not visible")
    }
    
    func checkCapsBtn(){
        let capsBtn = app.buttons["Caps"]
        let expectedCapsBtn = app.buttons["Caps Lock"]
        capsBtn.tap()
        XCTAssertTrue(expectedCapsBtn.exists, "The Caps Btn is not visible")
    }
    
    func checkNumBtn(){
        let numBtn = app.buttons["Num"]
        let expectedNumBtn = app.buttons["Num Lock"]
        numBtn.tap()
        XCTAssertTrue(expectedNumBtn.exists, "The Num Btn is not visible")
    }
    
    func checkClearAllModifiersBtn(){
        let expectedNumBtn = app.buttons["Num Lock"]
        let fnJButton = app.buttons["Function Lock J"]
        let fnTButton = app.buttons["FN Lock T"]
        
        let expectedButtons = expectedNumBtn.exists && fnJButton.exists && fnTButton.exists
        XCTAssertTrue(expectedButtons, "The expected buttons are not present")
        
        app.buttons["Clear All Modifiers"].tap()
        sleep(5)
        
        XCTAssertFalse(fnJButton.exists, "The expected button is still present")
        XCTAssertFalse(expectedNumBtn.exists, "The expected button is still present")
        XCTAssertFalse(fnTButton.exists, "The expected button is still present")
        
        //back to vocab
        app.buttons["Back"].tap()
    }
}

