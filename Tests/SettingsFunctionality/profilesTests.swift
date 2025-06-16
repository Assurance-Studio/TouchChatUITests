//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class profilesTests: XCTestCase {
    
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        let vocabularyName = "copied vocabulary"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
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
    
    func testprofilesTests() throws {
        
        let pages = Pages(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        
        pages.scrollDownUntilElementIsVisible(pages.basic4SS)
        pages.basic4SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "ALL ABOUT ME", vocabWord: "I want", vocabElement: 3, nameElement: "I want")
        
        //add a new profile
        profilesAndEditingPage.addAProfile()
        
        //check the new profile and check the override message
        profilesAndEditingPage.checkTheOverrideMessage()
        
        pages.backToVocab();
        
        //open a new vocab and load the new profile
        pages.engageForiOS.tap()
        pages.openAVocab()
        profilesAndEditingPage.loadTheNewProfile()
        
        //rename the new profile
        profilesAndEditingPage.renameTheNewProfile()
        
        //Remove the new profile and check if it was removed
        profilesAndEditingPage.removeTheNewProfile()
        
        pages.backToVocab()
                
        print("Profiles Tests Test Finished with success!")
        
        app.terminate()
    }
}
