//  importAVocabTests.swift
//  TouchChat
//
//  Created by Alin V on 18.12.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class importAVocabTests: XCTestCase {
    @IBOutlet weak var myTextView: UITextView!
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

    func testImportAVocab() throws {
        let pages = Pages(app: app)
        let modifiers = ModifiersPageClass(app: app)
        
        pages.importAVocab()
        app.buttons["Import/Export Vocab"].tap()
        
        let dropBoxBtn = app.buttons["DropBox"]
        let dropBoxBtnExists = dropBoxBtn.waitForExistence(timeout: 5)
        XCTAssert(dropBoxBtnExists)
        dropBoxBtn.tap()
        
        let importFromDropBox = app.buttons["Import from DropBox"]
        let importFromDropBoxExists = importFromDropBox.waitForExistence(timeout: 5)
        XCTAssertTrue(importFromDropBoxExists)
        importFromDropBox.tap()
//
//        if let data = pages.loadFile() {
//            pages.saveFileToDocuments(data: data, fileName: "modifiers", fileExtension: "ce")
//        }
        
        //login to DropBox
        sleep(7)
        
        let declineCookies = app.buttons["Decline"]
        if declineCookies.exists{
            declineCookies.tap()
        }
        let emailFieldDropBox = app.textFields["Email"]
        if emailFieldDropBox.exists{
            let emailFieldDropBoxExists = emailFieldDropBox.waitForExistence(timeout: 10)
            XCTAssertTrue(emailFieldDropBoxExists)
            emailFieldDropBox.tap()
            emailFieldDropBox.typeText("e2e.empower@gmail.com")
            app.buttons["Continue"].tap()
            
            app.secureTextFields.element(boundBy: 0).tap()
            app.secureTextFields.element(boundBy: 0).typeText("Testtableta01@")
            app.buttons["Log in"].tap()
            sleep(3)
            let savePass = app.buttons["Save Password"]
            let savePassExists = savePass.waitForExistence(timeout: 10)
            XCTAssertTrue(savePassExists)
            savePass.tap()
            app.buttons["Set up later"].tap()
            let allowBtn = app.buttons["Allow"]
            let allowBtnExists = allowBtn.waitForExistence(timeout: 10)
            XCTAssertTrue(allowBtnExists)
            allowBtn.press(forDuration: 2)
        }
       
        app.staticTexts["000_newvmodifiers.ce"].tap()
        
        let importFileName = app.staticTexts["Import File Name"]
        let importFileNameExists = importFileName.waitForExistence(timeout: 10)
        XCTAssertTrue(importFileNameExists)
        
        let descriptionVocab = app.textFields.element(boundBy: 1)
        let descriptionVocabExists = descriptionVocab.waitForExistence(timeout: 10)
        XCTAssertTrue(descriptionVocabExists)
        descriptionVocab.tap()
        descriptionVocab.typeText("gotomodif")
        app.buttons["Save"].tap()
        
        
        
        //open the modifiers vocab
        modifiers.openModifiersVocab()
        
        //Test the FN modifiers
        pages.testFnRow1()
        pages.testFnRow2()
        pages.testFnRow3()
        
        //Test the Lock Modifiers
        pages.testFirstRowLock()
        pages.testSecondRowLock()
        
        //check Shift Btn
        modifiers.checkShiftBtn()
        
        //check CTRL Btn
        modifiers.checkCTRLBtn()
        
        //check Caps Btn
        modifiers.checkCapsBtn()
        
        //check Num Btn
        modifiers.checkNumBtn()
        
        //Check the Clear All Modifiers function
        modifiers.checkClearAllModifiersBtn()
        
        pages.backToVocab()
        
        print("Import a Vocab Test Finished with success!")
        
//        guard let sourceURL = Bundle(for: type(of: self)).url(forResource: "modifiers", withExtension: "ce") else {
//            XCTFail("Failed to locate modifiers.ce in the test bundle!")
//            return
//        }
//        
//        // Specify the target directory and file name
//        let customPath = "/Users/alinv/Library/Developer/CoreSimulator/Devices/92B568CE-5C3C-4562-8245-259226F74C18"  // Replace this with your desired path
//        let targetURL = URL(fileURLWithPath: customPath).appendingPathComponent("modifiers.ce")
//        
//        let fileManager = FileManager.default
//        
//        // Remove the file at the target path if it already exists
//        if fileManager.fileExists(atPath: targetURL.path) {
//            do {
//                try fileManager.removeItem(at: targetURL)
//                print("Existing file removed at: \(targetURL.path)")
//            } catch {
//                XCTFail("Failed to remove existing file: \(error)")
//                return
//            }
//        }
//        
//        // Copy the file from the source to the target path
//        do {
//            try fileManager.copyItem(at: sourceURL, to: targetURL)
//            print("File successfully copied to: \(targetURL.path)")
//            
//            // Verify the file exists at the target path
//            XCTAssertTrue(fileManager.fileExists(atPath: targetURL.path), "File not found at target path!")
//            
//        } catch {
//            XCTFail("Failed to copy file: \(error)")
//        }
        
    }
        
    }
