//
//  LicenseLanguagePage.swift
//  LAMPAppUITest
//
//  Created by Alin V on 16.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

class LicenseLanguagePage {
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func checkContinueToggleLicenseModal(){
        let continueBtn = app.buttons["Continue"]
        XCTAssertTrue(continueBtn.exists, "The continue button is not visible.")
        XCTAssertFalse(continueBtn.isEnabled)
        continueBtn.tap()
        let licenseAgreement = app.staticTexts["License Agreement"]
        XCTAssertTrue(licenseAgreement.exists)
        
        let toggle = app.switches.element(boundBy: 0)
        toggle.tap()
        sleep(2)
        XCTAssertTrue(continueBtn.isEnabled, "The continue button is still disabled.")
        continueBtn.tap()
    }
    
    func checkVoicesAndLanguages(){
        let selectVoiceLanguage = app.staticTexts["Select your language and voice"]
        let selectVoiceLanguageExists = selectVoiceLanguage.waitForExistence(timeout: 5)
        XCTAssertTrue(selectVoiceLanguageExists, "The select voice language screen is not visible.")
        
        let englishLanguage = app.staticTexts["English"]
        let samanthaVoice = app.staticTexts["Samantha"]
        
        let byDefaultSettings = englishLanguage.exists && samanthaVoice.exists
        XCTAssertTrue(byDefaultSettings, "The default language and voice settings are not correct.")
        englishLanguage.tap()
        
        let spanishUS = app.buttons["Spanish (United States)"]
        let frenchCanada = app.buttons["French (Canada)"]
        
        let allLanguagesExist = spanishUS.exists && frenchCanada.exists
        XCTAssertTrue(allLanguagesExist, "The list of languages is not correct.")
        
        spanishUS.tap()
        let monicaLanguage = app.staticTexts["Mónica"]
        XCTAssertTrue(monicaLanguage.exists)
    }
    
    func addAnotherLanguageAndRemoveIt(){
        let continueBtn = app.buttons["Continue"]
        let englishLanguage = app.staticTexts["English"]
        let samanthaVoice = app.staticTexts["Samantha"]
        
        app.staticTexts["+ Add language"].tap()
        let byDefaultSettings = englishLanguage.exists && samanthaVoice.exists
        XCTAssertTrue(byDefaultSettings, "The default settings are not correct.")
        
        let closeBtn = app.buttons["close"]
        XCTAssertTrue(closeBtn.exists)
        closeBtn.tap()
        XCTAssertFalse(app.staticTexts["English"].exists, "The Enlish Language is still visible.")
        app.staticTexts["+ Add language"].tap()
        continueBtn.tap()
    }
    
    func openTheAppAndCheckVocabs(){
        let spanishUS = app.staticTexts["Spanish"]
        let spanishVocabExists = spanishUS.waitForExistence(timeout: 5)
        let englishVocab = app.staticTexts["English"]
        let englishVocabExists = englishVocab.waitForExistence(timeout: 5)
        
        XCTAssertTrue(spanishVocabExists)
        XCTAssertTrue(englishVocabExists)
    }
    
    func checkLicenseReaderPage(){
        let licenseReader = app.buttons["To proceed, please review our Software Application License Agreement."]
        XCTAssertTrue(licenseReader.exists, "The license link is visible.")
        licenseReader.tap()
        
        let licenseTitle = app.staticTexts["End User License Agreement"]
        let licenseTitleExists = licenseTitle.waitForExistence(timeout: 8)
        XCTAssertTrue(licenseTitleExists, "The license title is not visible.")
        app.buttons["Done"].tap()
    }
    
    func checkSelectVoiceModal(){
        let selectVoiceLanguage = app.staticTexts["Select your language and voice"]
        let selectVoiceLanguageExists = selectVoiceLanguage.waitForExistence(timeout: 5)
        XCTAssertTrue(selectVoiceLanguageExists, "The select voice language screen is not visible.")
    }
}
