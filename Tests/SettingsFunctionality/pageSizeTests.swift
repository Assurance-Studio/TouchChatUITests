//  TouchChatUITests
//
//  Created by Alin Voinescu on 05.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.


import XCTest

final class pageSizeTests: XCTestCase {
    
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
        app.launchArguments.append("--reset")
        app.launch()
        pages.clearAppCache()
        pages.resetPersistentStorage()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }
    
    func testPageSizeTests() throws {
        
        let pages = Pages(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        
        pages.scrollDownUntilElementIsVisible(element: pages.basic4SS)
        pages.myCoreSS.tap()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "are", vocabElement: 3, nameElement: "myQuickChat")
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //turn on the status bar and check if it works
        profilesAndEditingPage.unCheckStatusBar()
        
        //turn off the keyguard inset and check if it works
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.checkKeyguardInset()
        
        //return to initial settings for Page Size Tab
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.returnToInitialSettingsPageSize()
        
        pages.backToVocab()
                
        print("Page Size Tests Test Finished with success!")
        
        app.terminate()
        
    }
}
