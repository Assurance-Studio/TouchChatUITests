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
        
        modifiers.importVocab()
        
        //open the modifiers vocab
        modifiers.openModifiersVocab()
        
        //Test the FN modifiers
        pages.testFnRow1()
        pages.testFnRow2()
        
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
