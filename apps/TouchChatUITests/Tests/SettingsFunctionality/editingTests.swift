//  TouchChatUITests
//
//  Created by Alin Voinescu on 02.08.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class editingTests: XCTestCase {
    
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
    
    func testEditingTests() throws {
        
        let pages = Pages(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        
        pages.myCoreSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "are", vocabElement: 3, nameElement: "myQuickChat")
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //set a menu password
        profilesAndEditingPage.setAPassMenu()
        
        //check if the password works
        profilesAndEditingPage.checkIfThePassWorks()
        
        //Remove the password and check if it was removed
        profilesAndEditingPage.removeThePass()
        
        pages.backToVocab()
                
        print("Editing Tests Test Finished with success!")
        
        app.terminate()
        
    }
}
