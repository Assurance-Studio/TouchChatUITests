//  licenseAgreementTests.swift
//  LAMPAppUITest
//  Created by Alin V on 16.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class licenseAgreementTests: XCTestCase {

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

   func testLicenseAgreementTests() throws {
       
       let licensePage = LicenseLanguagePage(app: app)
       //check the License Reader Page
       licensePage.checkLicenseReaderPage()
       
       //check the continue button
       licensePage.checkContinueToggleLicenseModal()
       
       //check Selected Voice Language Modal
       licensePage.checkSelectVoiceModal()
       
       print("License Agreement Test Finished with success!")
    }
}
