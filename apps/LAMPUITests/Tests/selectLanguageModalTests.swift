//  selectLanguageModalTests.swift
//  LAMPAppUITest
//  Created by Alin V on 16.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class selectLanguageModalTests: XCTestCase {

    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
   }
   
   override func tearDownWithError() throws {
       app.terminate()
       try super.tearDownWithError()
   }

   func testSelectLanguageTests() throws {
       let licensePage = LicenseLanguagePage(app: app)
       //check the continue button
       licensePage.checkContinueToggleLicenseModal()
       
       //check the functions within the select Voice Modal
       licensePage.checkVoicesAndLanguages()
       
       //add another language and check if the "X" button is visible
       licensePage.addAnotherLanguageAndRemoveIt()
       
       //check the vocabs
       licensePage.openTheAppAndCheckVocabs()
       
       print("Select Language Test Finished with success!")
    }
}
